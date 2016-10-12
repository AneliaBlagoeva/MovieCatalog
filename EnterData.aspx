<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterData.aspx.cs" Inherits="VideoLibrary.EnterData" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <body>
        <form id="form1" runat="server">

            <asp:HyperLink ID="BackHyperLink" runat="server" NavigateUrl="~/Default.aspx">Връщане към началната страница</asp:HyperLink>
            <br />
            <br />
            <asp:Label ID="DbStatusLabel" runat="server"></asp:Label>
            <br />
            <asp:Label ID="XmlStatusLabel" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="ErrorLabel" runat="server" Text="" Font-Bold="True" Font-Names="Arial" Font-Strikeout="False" ForeColor="#FF3300"></asp:Label>
            <br />
            <br />
            <asp:Label ID="XmlLabel" runat="server" Text="" Font-Bold="True" Font-Names="Arial" Font-Strikeout="False" ForeColor="#FF3300"></asp:Label>
            <br />
            <br />
    <table id="tableId">
        <tr>
            <td>САЙТ</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Име на сайт" AssociatedControlID="TextBox1"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Линк на сайт" AssociatedControlID="TextBox2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
            </td>
        </tr>


        <tr>
            <td>
                ВИДЕО
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Име на видео" AssociatedControlID="TextBox3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Продължителност" AssociatedControlID="TextBox4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator6" runat="server" ErrorMessage="Трябва да е число" ControlToValidate="TextBox4" OnServerValidate="CustomValidator6_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Страна" AssociatedControlID="TextBox5"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Година" AssociatedControlID="TextBox6"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator7" runat="server" ErrorMessage="Трябва да е число" ControlToValidate="TextBox6" OnServerValidate="CustomValidator6_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Сюжет" AssociatedControlID="TextBox7"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Език на аудиото " AssociatedControlID="TextBox8"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox8"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Рейтинг" AssociatedControlID="TextBox9"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox9"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator8" runat="server" ErrorMessage="Трябва да е число" ControlToValidate="TextBox9" OnServerValidate="CustomValidator6_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="HD" AssociatedControlID="TextBox11"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox11"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Yes / No" ControlToValidate="TextBox11" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Субтитри" AssociatedControlID="TextBox12"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox12"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Yes / No" ControlToValidate="TextBox12" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" runat="server" Text="Жанр" AssociatedControlID="TextBox13"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox13"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="action / adventure / comedy / romantic / drama" ControlToValidate="TextBox13" OnServerValidate="CustomValidator4_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="Тип на видео" AssociatedControlID="TextBox15"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox15"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="movie / tvShow" ControlToValidate="TextBox15" OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>



        <tr>
            <td>СТУДИО</td>
        </tr>
        <tr>
            <td>&nbsp;<asp:Label ID="Label16" runat="server" Text="Име на студиото" AssociatedControlID="TextBox16"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox16"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label17" runat="server" Text="ID на студио " AssociatedControlID="TextBox17"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox17"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label18" runat="server" Text="Продуцент" AssociatedControlID="TextBox18"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox18"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label19" runat="server" Text="Адрес " AssociatedControlID="TextBox19"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox19"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label20" runat="server" Text="Телефон " AssociatedControlID="TextBox20"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox20"></asp:RequiredFieldValidator>
            </td>
        </tr>




        <tr>
            <td>АКТЬОР</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label21" runat="server" Text="Име на актьор" AssociatedControlID="TextBox21"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox21"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label22" runat="server" Text="Фамилия на актьор " AssociatedControlID="TextBox22"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox22"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label23" runat="server" Text="Пол" AssociatedControlID="TextBox23"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox23"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator5" runat="server" ErrorMessage="M / F" ControlToValidate="TextBox23" OnServerValidate="CustomValidator5_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label24" runat="server" Text="Години" AssociatedControlID="TextBox24"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox24"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator9" runat="server" ErrorMessage="Трябва да е число" ControlToValidate="TextBox24" OnServerValidate="CustomValidator6_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label25" runat="server" Text="ID на актьор " AssociatedControlID="TextBox25"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox25"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label26" runat="server" Text="Страна " AssociatedControlID="TextBox26"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox26"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label27" runat="server" Text="Email" AssociatedControlID="TextBox27"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox27"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label28" runat="server" Text="Телефон на актьор" AssociatedControlID="TextBox28"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox28"></asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
            <td>&nbsp;<asp:Label ID="Label29" runat="server" Text="Социална мрежа" AssociatedControlID="TextBox29"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox>
            </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox29"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td>&nbsp;<asp:Label ID="Label30" runat="server" Text="Говорим основен език" AssociatedControlID="TextBox30"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="Задължително поле" ControlToValidate="TextBox30"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr runat="server">
                    <td colspan="2">
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Добавяне" OnClick="InsertButton_Click" />
                    </td>
                </tr>
    </table>
        </form>
    </body>
</head>
</html>
