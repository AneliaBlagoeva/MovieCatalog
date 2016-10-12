<%@ Page Title="Добре дошли" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VideoLibrary._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol>
        <li>
            <asp:Button ID="ImportButton" runat="server" Text="Прехвърляне на XML файлове в БД" PostBackUrl="~/importxml.aspx" />
        </li>
        <li>
            <asp:HyperLink ID="EnterDataHyperLink" runat="server" NavigateUrl="~/EnterData.aspx">Въвеждане на данни</asp:HyperLink>
        </li>
    </ol>
</asp:Content>

