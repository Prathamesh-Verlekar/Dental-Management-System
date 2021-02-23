<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DMDD_WebApplication.index" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DMDD_WebApplication.index" %>--%>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="sidenav">
         <div class="login-main-text">
            <h2>Application<br> Login Page</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
              
                  <div class="form-group">
                     <label>User Name</label>
                     <asp:TextBox CssClass="form-control" runat="server"  ></asp:TextBox>
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                      <asp:TextBox CssClass="form-control"  TextMode="Password" runat="server"  ></asp:TextBox>
                     <%--<input type="password" class="form-control" placeholder="Password">--%>
                  </div>
                   <asp:Button runat="server" CssClass="btn btn-black" Text="Login" />
                   <%--<asp:Button runat="server" CssClass="btn btn-black" Text="Login" />--%>

<%--                  <button type="submit" class="btn btn-black">Login</button>
                  button type="submit" class="btn btn-secondary">Register</button>--%>
      
            </div>
         </div>
      </div>


</asp:Content>
