<%@ Page Title = "Прехвърляне на XML файловете в БД" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="importxml.aspx.cs" Inherits="VideoLibrary.ImportXmlFiles" %>

<asp:Content ID = "Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID = "Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID = "BackHyperLink" runat="server" NavigateUrl="~/Default.aspx">Връщане към началната страница</asp:HyperLink>
    <br />
    <br />
    <h2>Резултати от прехвърлянето:</h2>
    <asp:Table ID = "ImportStatusTable" runat= "server" BorderWidth= "1px" CellPadding= "10" GridLines= "Horizontal" ></asp:Table>


    <br />
    <br />


    <br />
    <br />
    <h2>Изчистване на БД</h2>
      <asp:Literal ID = "TruncateStatusLiteral" runat= "server" ></asp:Literal>
      <asp:Button ID = "TruncateButton" runat= "server" Text= "Изчистване на цялата БД" OnClick= "TruncateButton_Click" />
  </asp:Content>
