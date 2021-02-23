<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateAppointment.aspx.cs" Inherits="DMDD_WebApplication.Appointment.CreateAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


     <asp:HiddenField ID="hfdentistID" runat="server" Value="-1" />
    <div class="form-group row" style="margin-top: 5%">
        <div class="col-sm-2">
            <label>Appointment ID :</label>

        </div>
        
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtappointmentid" placeholder=" Appointment ID"></asp:TextBox>

        </div>
        <div class="col-sm-2">
            <label>Dentist ID:</label>

        </div>
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtdentistid" placeholder=" Dentist ID "></asp:TextBox>

        </div>
    
        <div class="col-sm-2">
            <label>Patient ID :</label>

        </div>
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtpatientid" placeholder=" Patient ID "></asp:TextBox>

        </div>
        <div class="col-sm-2">
            <label>Room ID :</label>

        </div>
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtroomid" placeholder=" Room ID"></asp:TextBox>

        </div>
    
        <div class="col-sm-2">
            <label>Appointment Start Time :</label>

        </div>
        <div class="col-sm-4">

            <asp:TextBox runat="server" CssClass="form-control" ID="txtappointmentstarttime" placeholder=" Appointment Start Time"></asp:TextBox>

        </div>
	
        <div class="col-sm-2">
            <label>Appointment End Time :</label>

        </div>
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtappointmentendtime" placeholder=" Appointment End Time"></asp:TextBox>

        </div>
		
        <div class="col-sm-2">
            <label>Modified By :</label>

        </div>
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtmodifiedby" placeholder=" Modified By"></asp:TextBox>

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
            <asp:GridView ID="gvAppointment" runat="server" OnRowCommand="gvAppointment_RowCommand" AutoGenerateColumns="False" Width="1172px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
                     
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbledit" runat="server" CommandArgument='<%#Eval("Appointment_id")%>' CommandName="cmdedit">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbldelete" runat="server" CommandArgument='<%#Eval("Appointment_id")%>' CommandName="cmddelete">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:BoundField HeaderText="Appointment ID" DataField="AppointmentID" />
                    <asp:BoundField HeaderText="Dentist ID" DataField="DentistID" />
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
