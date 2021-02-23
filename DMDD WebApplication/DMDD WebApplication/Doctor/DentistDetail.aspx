<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DentistDetail.aspx.cs" Inherits="DMDD_WebApplication.Doctor.DentistDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hfdentistID" runat="server" Value="-1" />
    <div class="form-group row" style="margin-top: 5%">
        <div class="col-sm-2">
            <label>First Name :</label>

        </div>
        
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtfirstname" placeholder=" First Name"></asp:TextBox>

        </div>
        <div class="col-sm-2">
            <label>Last Name:</label>

        </div>
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtlastName" placeholder=" Last Name "></asp:TextBox>

        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-2">
            <label>Middler Name :</label>

        </div>
        <div class="col-sm-4">
            <asp:TextBox runat="server" ID="txtMiddleName" CssClass="form-control"></asp:TextBox>

        </div>
        <div class="col-sm-2">
            <label>Work Experience :</label>

        </div>
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtworkexp" placeholder=" Work Experience"></asp:TextBox>

        </div>
    </div>


    <div class="form-group row">
        <div class="col-sm-2">
            <label>Dentist Type :</label>

        </div>
        <div class="col-sm-4">

            <asp:DropDownList ID="ddldentistType" runat="server" CssClass="form-control">

                <asp:ListItem Text="Orthodontist" Value="1"></asp:ListItem>

            </asp:DropDownList>

        </div>
        <div class="col-sm-2">
            <label>SSN :</label>

        </div>
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtssn" placeholder=" Social Security Number" TextMode="Password"></asp:TextBox>

        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-2">
            <label>Gender : </label>

        </div>
        <div class="col-sm-4">

            <asp:DropDownList ID="ddlgender" runat="server" CssClass="form-control">

                <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                <asp:ListItem Text="Other" Value="3"></asp:ListItem>

            </asp:DropDownList>
        </div>
        <div class="col-sm-2">
            <label>Location :</label>

        </div>
        <div class="col-sm-4">

            <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control">
                <asp:ListItem Text="Boston" Value="1"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-12" style="text-align: center">
            <asp:Button runat="server" Text="Save" CssClass="btn btn-primary" ID="btnsave" OnClick="btnsave_Click" />
            <asp:Button runat="server" Text="Cancel" CssClass="btn btn-danger" ID="btncancel" />

        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-12" style="text-align: center">
            <asp:GridView ID="gvDentist" runat="server" OnRowCommand="gvDentist_RowCommand" AutoGenerateColumns="False" Width="1172px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
                    
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbledit" runat="server" CommandArgument='<%#Eval("Dentist_ID")%>' CommandName="cmdedit">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbldelete" runat="server" CommandArgument='<%#Eval("Dentist_ID")%>' CommandName="cmddelete">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:BoundField HeaderText="Dentist Name" DataField="DentistName" />
                    <asp:BoundField HeaderText="Gender" DataField="Gender" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </div>
    </div>




</asp:Content>
