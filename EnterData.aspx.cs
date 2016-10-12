using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Xml.Linq;

namespace VideoLibrary
{
    public partial class EnterData : System.Web.UI.Page
    {

        Models.videolibraryEntities1 context = new Models.videolibraryEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {

            Models.videolibrary videolibrary = SaveToDb();
            SaveToXML(videolibrary);


        }

        private void SaveToXML(Models.videolibrary videolibrary)
        {
            if (videolibrary == null)
            {
                XmlLabel.Text = "Не се записва XML файл при грешка в БД!";
                XmlLabel.ForeColor = System.Drawing.Color.Red;
                return;
            }
            else
            {
                try
                {
                    XDocument videolibraryXml = ModelToXml(videolibrary);
                    videolibraryXml.Save(Server.MapPath("~/App_Data/" + videolibrary.nameSite + videolibrary.videolibraryId + ".xml"));
                }
                catch (Exception ex)
                {
                    XmlLabel.Text = "Грешка при записването в XML файл: " + ex.Message;
                    XmlLabel.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                XmlLabel.Text = "Успешно записване в XML файл";
                XmlLabel.ForeColor = System.Drawing.Color.Green;
            }
        }

        private XDocument ModelToXml(Models.videolibrary videoLibrary)
        {
            var doc = new XDocument(new XDocumentType("videolibrary", null, "videolibrary.dtd", null));

            XElement root = new XElement("videolibrary");
            root.SetElementValue("nameSite", videoLibrary.nameSite);
            root.SetElementValue("siteLink", videoLibrary.siteLink);
            root.Add(new XElement("videos"));
            XElement elem = root.Element("videos");
            XElement videos = null;
            foreach(var video in videoLibrary.videos)
            {
                videos = new XElement("video");
                videos.SetAttributeValue("isHd", video.isHd);
                videos.SetAttributeValue("gendre", video.gendre);
                videos.SetAttributeValue("produced-by", video.produced_by);
                videos.SetAttributeValue("type", video.type);
                videos.SetAttributeValue("hasSubtitle", video.hasSubtitle);
                videos.SetElementValue("filmName", video.filmName);
                videos.SetElementValue("duration", video.duration);
                videos.SetElementValue("year", video.year);
                videos.SetElementValue("country", video.country);
                videos.SetElementValue("plot", video.plot);
                videos.SetElementValue("audioLanguage", video.audioLanguage);
                videos.SetElementValue("rating", video.rating);
                videos.Add(new XElement("actorsIN"));
                XElement actorsIN = videos.Element("actorsIN");
                XElement actor_ref = new XElement("actor-ref");
                actorsIN.Add(actor_ref);
                videos.Element("actorsIN").Element("actor-ref").SetAttributeValue("actorID", video.actor_ref);
                elem.Add(videos);
            }

            root.Add(new XElement("studios"));
            elem = root.Element("studios");
            XElement studio = null;
            foreach(var item in videoLibrary.studios)
            {
                studio = new XElement("studio");
                studio.SetAttributeValue("id", item.id);
                studio.SetElementValue("studioName", item.studioName);
                studio.SetElementValue("director", item.director);
                studio.SetElementValue("address", item.address);
                studio.SetElementValue("phone", item.phone);
                elem.Add(studio);
            }
            root.Add(new XElement("actors"));
            elem = root.Element("actors");
            XElement actor = null;
            foreach(var item in videoLibrary.actors)
            {
                actor = new XElement("actor");
                actor.SetAttributeValue("gender", item.gender);
                actor.SetAttributeValue("age", item.age);
                actor.SetAttributeValue("id", item.id);
                actor.Add(new XElement("name"));
                actor.Element("name").SetElementValue("first", item.first);
                actor.Element("name").SetElementValue("last", item.last);
                actor.SetElementValue("countryActor", item.countryActor);
                actor.SetElementValue("email", item.email);
                actor.SetElementValue("actorPhone", item.actorPhone);
                actor.SetElementValue("socialNetworkLink", item.socialNetworkLink);
                actor.SetElementValue("nativeLanguage", item.nativeLanguage);
                elem.Add(actor);
            }
            doc.Add(root);
            return doc;
        }

        private Models.videolibrary SaveToDb()
        {
            Models.videolibrary videolibrary = null;

            try
            {
                videolibrary = ControlsToModel();
                context.videolibraries.Add(videolibrary);
                context.SaveChanges();

            }
            catch (ArgumentException ex)
            {
                ErrorLabel.Text = ex.Message;
                ErrorLabel.ForeColor = System.Drawing.Color.Red;
                videolibrary = null;
            }
            catch (Exception ex)
            {
                ErrorLabel.Text = "Има проблем с данните, които сте въвели";
                ErrorLabel.ForeColor = System.Drawing.Color.Red;
                videolibrary = null;
            }
            if (videolibrary != null)
            {
                ErrorLabel.Text = "Вашите данни са успешно запазени в БД!";
                ErrorLabel.ForeColor = System.Drawing.Color.Green;
            }
            return videolibrary;
        }

        private Models.videolibrary ControlsToModel()
        {
            var videolibrary = new Models.videolibrary();
            videolibrary.nameSite = TextBox1.Text;
            videolibrary.siteLink = TextBox2.Text;
            videolibrary.videolibraryId = ImportXmlFiles.getMaxVal() + 1;
            if (context.videolibraries.Find(videolibrary.videolibraryId) != null)
            {
                throw new ArgumentException("този сайт (с линк: " + videolibrary.siteLink + ") вече е в БД");
            }

            var video = new Models.video();
            video.filmName = TextBox3.Text;
            if (context.videos.Find(video.filmName) != null)
            {
                throw new ArgumentException("това видео (с име: " + video.filmName + ") вече е в БД");
            }
            video.duration = Int16.Parse(TextBox4.Text);
            video.country = TextBox5.Text;
            video.year = Int16.Parse(TextBox6.Text);
            video.plot = TextBox7.Text;
            video.audioLanguage = TextBox8.Text;
            video.rating = Int16.Parse(TextBox9.Text);
            video.isHd = TextBox11.Text;
            video.hasSubtitle = TextBox12.Text;
            video.gendre = TextBox13.Text;
            video.type = TextBox15.Text;

            var studio = new Models.studio();
            studio.studioName = TextBox16.Text;
            studio.id = TextBox17.Text;
            if (context.studios.Find(studio.id) != null)
            {
                throw new ArgumentException("това студио (с id: " + studio.id + ") вече е в БД");
            }
            studio.director = TextBox18.Text;
            studio.address = TextBox19.Text;
            studio.phone = TextBox20.Text;
            studio.videolibraryID = videolibrary.videolibraryId;

            var actor = new Models.actor();
            actor.first = TextBox21.Text;
            actor.last = TextBox22.Text;
            actor.gender = TextBox23.Text;
            actor.age = Int16.Parse(TextBox24.Text);
            actor.id = TextBox25.Text;
            if (context.actors.Find(actor.id) != null)
            {
                throw new ArgumentException("този актьор (с id: " + actor.id + ") вече е в БД");
            }
            actor.countryActor = TextBox26.Text;
            actor.email = TextBox27.Text;
            actor.actorPhone = TextBox28.Text;
            actor.socialNetworkLink = TextBox29.Text;
            actor.nativeLanguage = TextBox30.Text;
            actor.videolibraryID = videolibrary.videolibraryId;

            video.actor_ref = actor.id;
            video.videolibraryID = videolibrary.videolibraryId;
            video.produced_by = studio.id;

            videolibrary.actors.Add(actor);
            videolibrary.studios.Add(studio);
            videolibrary.videos.Add(video);

            return videolibrary;
        }

        protected void CustomValidator6_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var field = args.Value;
            args.IsValid = IsNumber(field);
        }

        private bool IsNumber(string field)
        {
            return Regex.IsMatch(field, @"^\d+$");
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var field = args.Value ;
            args.IsValid = false;
            if(field.Equals("yes") || field.Equals("no"))
            {
                args.IsValid = true;
            }
            
        }

        protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var field = args.Value;
            args.IsValid = false;
            if (field.Equals("action") || field.Equals("comedy") || field.Equals("adventure") || field.Equals("drama") || field.Equals("romantic"))
            {
                args.IsValid = true;
            }
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var field = args.Value;
            args.IsValid = false;
            if (field.Equals("tvShow") || field.Equals("movie"))
            {
                args.IsValid = true;
            }

        }

        protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var field = args.Value;
            args.IsValid = false;
            if (field.Equals("M") || field.Equals("F"))
            {
                args.IsValid = true;
            }
        }

    }
}