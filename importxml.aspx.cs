using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Schema;

namespace VideoLibrary
{

    public partial class ImportXmlFiles : System.Web.UI.Page
    {
		public static int getMaxVal()
        {
            SqlConnection sqlConnection1 = new SqlConnection(@"data source=ANI-PC\SQLEXPRESS; initial catalog=videolibrary; integrated security=SSPI");

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "select COUNT(videolibraryId) from [videolibrary].[dbo].[videolibrary];";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = sqlConnection1;

            sqlConnection1.Open();

            int maxVal;
            int cntRow = Convert.ToInt32(cmd.ExecuteScalar());
            if (cntRow > 0)
            {
                cmd.CommandText = "select max(videolibraryId) from [videolibrary].[dbo].[videolibrary];";
                maxVal = Convert.ToInt32(cmd.ExecuteScalar());
            }
            else
            {
                maxVal = 1;
            }
            sqlConnection1.Close();
            return maxVal;
        }
		
        Models.videolibraryEntities1 context = new Models.videolibraryEntities1();
        string temp = " ";
        public static int i=getMaxVal() + 1;
        protected void Page_Load(object sender, EventArgs e)
        {
           

            foreach (string filename in Directory.GetFiles(Server.MapPath("~/App_Data"), "*.xml"))
            {
                string status = "успешно прехвърлен в БД" + temp;
                Boolean success = true;

                try
                {
                    
                    XmlReaderSettings settings = new XmlReaderSettings();
                    settings.ValidationType = ValidationType.Schema;
                    settings.ValidationFlags = settings.ValidationFlags | XmlSchemaValidationFlags.ReportValidationWarnings;
                    settings.DtdProcessing = DtdProcessing.Ignore;

                    // Зареждане на файла и валидиране
                    XmlReader reader = XmlReader.Create(filename, settings);
                    XmlDocument doc = new XmlDocument();
                    doc.Load(reader);
                    doc.Schemas.Add(null, Server.MapPath("~/App_Data/videolibrary.xsd"));
                    doc.Validate(null);

                    // Преобразуване от обекти на XML в обекти на модела и проверка дали вече съществуват в БД
                    XmlToDb(doc);
                }

                catch (Exception ex)
                {
                    status = "Грешка при прехвърлянето: " + ex.Message + temp;
                    success = false;
                }

                // Добавяне на ред в таблицата на състоянията на прехвърлянето
                TableRow fileRow = new TableRow();
                fileRow.Cells.Add(new TableCell() { Text = Path.GetFileName(filename) });
                fileRow.Cells.Add(new TableCell() { Text = "– " + status, ForeColor = success ? Color.Green : Color.Red });
                ImportStatusTable.Rows.Add(fileRow);
            }

            //VideoLibrariesGridView.DataBind();
        }

        

        private void XmlToDb(XmlNode xmlDocument)
        {
            var videolibraryXml = xmlDocument.SelectSingleNode("videolibrary");

            //object from model VideoLibrary
            var videolibrary = new Models.videolibrary();

            //element from model = node from xml
            videolibrary.nameSite = videolibraryXml.SelectSingleNode("nameSite").InnerText;
            videolibrary.siteLink = videolibraryXml.SelectSingleNode("siteLink").InnerText;
            videolibrary.videolibraryId = i;i++;

            if (context.videolibraries.Find(videolibrary.videolibraryId) != null)
            {
                throw new Exception("този сайт (с линк: " + videolibrary.videolibraryId + ") вече е в БД");
            }


            foreach (XmlNode videoXml in videolibraryXml.SelectNodes("videos/video"))
            {
                var video = new Models.video();
                video.filmName = videoXml.SelectSingleNode("filmName").InnerText;
                if(context.videos.Find(video.filmName) != null)
                {
                    throw new Exception("това видео (с име: " + video.filmName + ") вече е в БД");
                }
                video.duration = Int16.Parse(videoXml.SelectSingleNode("duration").InnerText, CultureInfo.InvariantCulture);
                video.country = videoXml.SelectSingleNode("country").InnerText;
                video.year = Int16.Parse(videoXml.SelectSingleNode("year").InnerText, CultureInfo.InvariantCulture);
                video.plot = videoXml.SelectSingleNode("plot").InnerText; ;
                video.audioLanguage = videoXml.SelectSingleNode("audioLanguage").InnerText;
                video.rating = Int16.Parse(videoXml.SelectSingleNode("rating").InnerText, CultureInfo.InvariantCulture);
                var actorsIn = videoXml.SelectSingleNode("actorsIN/actor-ref");
                video.actor_ref = actorsIn.Attributes["actorID"].InnerText;

                video.isHd = videoXml.Attributes["isHd"].InnerText;
               
                video.hasSubtitle = videoXml.Attributes["hasSubtitle"].InnerText;
                video.gendre = videoXml.Attributes["gendre"].InnerText;
                video.produced_by = videoXml.Attributes["produced-by"].InnerText;
                video.type = videoXml.Attributes["type"].InnerText;
                video.videolibraryID = videolibrary.videolibraryId;

                //add object such as propertie to videolibrary
                videolibrary.videos.Add(video);
            }


            foreach (XmlNode actorXml in videolibraryXml.SelectNodes("actors/actor"))
            {
                var actor = new Models.actor();

                var name = actorXml.SelectSingleNode("name");
                actor.first = name.SelectSingleNode("first").InnerText;
                actor.last = name.SelectSingleNode("last").InnerText;

                actor.countryActor = actorXml.SelectSingleNode("countryActor").InnerText;
                actor.email = actorXml.SelectSingleNode("email").InnerText;
                actor.actorPhone = actorXml.SelectSingleNode("actorPhone").InnerText;
                actor.socialNetworkLink = actorXml.SelectSingleNode("socialNetworkLink").InnerText; ;
                actor.nativeLanguage = actorXml.SelectSingleNode("nativeLanguage").InnerText;
                actor.id = actorXml.Attributes["id"].InnerText;
                if (context.actors.Find(actor.id) != null)
                {
                    throw new Exception("този актьор (с id: " + actor.id + ") вече е в БД");
                }
                actor.age = Int16.Parse(actorXml.Attributes["age"].InnerText, CultureInfo.InvariantCulture); ;
                actor.gender = actorXml.Attributes["gender"].InnerText;

                actor.videolibraryID = videolibrary.videolibraryId;

                //add object such as propertie to videolibrary
                videolibrary.actors.Add(actor);
            }


            foreach (XmlNode studioXml in videolibraryXml.SelectNodes("studios/studio"))
            {
                var studio = new Models.studio();
                studio.studioName = studioXml.SelectSingleNode("studioName").InnerText;
                studio.director = studioXml.SelectSingleNode("director").InnerText;
                studio.address = studioXml.SelectSingleNode("address").InnerText;
                studio.phone = studioXml.SelectSingleNode("phone").InnerText;
                studio.id = studioXml.Attributes["id"].InnerText;
                if (context.studios.Find(studio.id) != null)
                {
                    throw new Exception("това студио (с id: " + studio.id + ") вече е в БД");
                }
                studio.videolibraryID = videolibrary.videolibraryId;

                //add object such as propertie to videolibrary
                videolibrary.studios.Add(studio);
            }
           

            try
            {
                context.videolibraries.Add(videolibrary);
                context.SaveChanges();
            }
            catch (DbEntityValidationException dbEx)
            {
               foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                         temp= validationError.PropertyName +" "+ validationError.ErrorMessage;
                    }
                }
            }

        }


        protected void TruncateButton_Click(object sender, EventArgs e)
        {
           
            //Обновяване на контролите, които показват съдържанието на БД
            //VideoLibrariesGridView.DataBind();
            SqlConnection sqlConnection1 = new SqlConnection(@"data source=ANI-PC\SQLEXPRESS; initial catalog=videolibrary; integrated security=SSPI");
            string temp=" ";
            try
            {

                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;


                
                //drop FKs,truncate,add FKs
                cmd.CommandText = "alter table [dbo].[videos] drop constraint FK_videos_videolibrary;" +
                                  "alter table [dbo].[studios] drop constraint FK_studios_videolibrary;" +
                                  "alter table [dbo].[actors] drop constraint FK_actors_videolibrary;" +
                                  "truncate table [dbo].[videos];" +
                                  "truncate table [dbo].[actors];" +
                                  "truncate table [dbo].[studios];" +
                                  "truncate table [dbo].[videolibrary];" +
                                  "ALTER TABLE [dbo].[videos] ADD CONSTRAINT FK_videos_videolibrary FOREIGN KEY (videolibraryID) REFERENCES videolibrary(videolibraryId);" +
                                  "ALTER TABLE [dbo].[studios] ADD CONSTRAINT FK_studios_videolibrary FOREIGN KEY (videolibraryID) REFERENCES videolibrary(videolibraryId);" +
                                  "ALTER TABLE [dbo].[actors] ADD CONSTRAINT FK_actors_videolibrary FOREIGN KEY (videolibraryID) REFERENCES videolibrary(videolibraryId);";

                cmd.CommandType = CommandType.Text;
                cmd.Connection = sqlConnection1;

                sqlConnection1.Open();

                reader = cmd.ExecuteReader();
            }
            catch (System.Exception se)
            {
                temp=se.Message;
            }
            finally
            {
                sqlConnection1.Close();

            }


            TruncateStatusLiteral.Text = "Цялата БД е изчистена." + temp;
            ImportStatusTable.Rows.Clear();

        }



        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Models.videolibrary> VideoLibrariesGridView_GetData()
        {
            return context.videolibraries;
        }

    }
}
