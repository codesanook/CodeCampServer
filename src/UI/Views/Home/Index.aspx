﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<UserGroupInput>" %>
<%@ Import Namespace="CodeCampServer.UI.Services.Common"%>
<%@ Import Namespace="MvcContrib.UI.ParamBuilder"%>
<%@ Import Namespace="CodeCampServer.UI.Helpers.Extensions"%>
<%@ Import Namespace="CodeCampServer.Core.Common"%>

<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheets" runat="server">
    <script type="text/javascript" src="/scripts/rsswidget.js"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="Main" runat="server">
<% TempData.Select(pair => pair.Value).ForEach(o => Writer.Write(o)); %>
    <%=Html.ValidationSummary()%>
    <%Html.RenderAction("UpComing", "Event", ViewContext.RouteData.DataTokens);%>
</asp:Content>
<asp:Content ContentPlaceHolderID="SidebarPlaceHolder" runat="server">
    <%Html.RenderPartial("Sponsors", Model.Sponsors);%>
    <hr />
    <h2>
        <%= Model.Name %>
    </h2>
        <%Html.RenderPartial("EditUserGroupLink", Model); %>
    <p>
        <%= Model.Location() %>
        </p>
    <hr />
    <p>
				<%
          RouteValueDictionary route = Params.With.ViewAsPdf();%>
        <a href="<%=Url.Action<HomeController>(x=>x.Events(null), route) %>">Save All Events as PDF</a>
    </p>
</asp:Content>
