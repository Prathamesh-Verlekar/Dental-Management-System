<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientDetail.aspx.cs" Inherits="DMDD_WebApplication.Patient.PatientDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hfpatientID" runat="server" Value="-1" />
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
            <label>Middle Name :</label>

        </div>
        <div class="col-sm-4">
            <asp:TextBox runat="server" ID="txtMiddleName" CssClass="form-control"></asp:TextBox>

        </div>

    <div class="col-sm-2">
            <label>Date Of Birth :</label>

        </div>
        
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtDateOfBirth" placeholder=" Date Of Birth"></asp:TextBox>

        </div>

    <div class="col-sm-2">
            <label>Patient Address :</label>

        </div>
        
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtPatientAddress" placeholder=" Patient Address"></asp:TextBox>

        </div>

    <div class="col-sm-2">
            <label>City ID :</label>

        </div>
        
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtCity_ID" placeholder=" City ID"></asp:TextBox>

        </div>

    <div class="col-sm-2">
            <label>ZipCode :</label>

        </div>
        
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtZipCode" placeholder=" ZipCode"></asp:TextBox>

        </div>

    <div class="col-sm-2">
            <label>Emergency Contact Number :</label>

        </div>
        
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtEmergencyContactNumber" placeholder=" Emergency Contact Number"></asp:TextBox>

        </div>

    <div class="col-sm-2">
            <label>Emergency Contact Name :</label>

        </div>
        
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtEmergencyContactName" placeholder=" Emergency Contact Name"></asp:TextBox>

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
    </div>

    <div class="form-group row">
        <div class="col-sm-12" style="text-align: center">
            <asp:Button runat="server" Text="Save" CssClass="btn btn-primary" ID="btnsave" OnClick="btnsave_Click" />
            <asp:Button runat="server" Text="Cancel" CssClass="btn btn-danger" ID="btncancel" />

        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-12" style="text-align: center">
            <asp:GridView ID="gvPatient" runat="server" OnRowCommand="gvPatient_RowCommand" AutoGenerateColumns="False" Width="1172px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
                    
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbledit" runat="server" CommandArgument='<%#Eval("Patient_ID")%>' CommandName="cmdedit">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbldelete" runat="server" CommandArgument='<%#Eval("Patient_ID")%>' CommandName="cmddelete">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:BoundField HeaderText="Patient Name" DataField="PatientName" />
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
