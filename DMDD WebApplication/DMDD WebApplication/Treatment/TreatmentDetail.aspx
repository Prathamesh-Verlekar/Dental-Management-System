<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TreatmentDetail.aspx.cs" Inherits="DMDD_WebApplication.Doctor.DentistDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hftreatmentID" runat="server" Value="-1" OnValueChanged="hftreatmentID_ValueChanged" />
    <div class="form-group row" style="margin-top: 5%">
        <div class="col-sm-2">
            <strong>Treatment Comments:</strong></div>
        
        <div class="col-sm-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtTreatmentComment" placeholder=" TreatmentComments"></asp:TextBox>

        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-12" style="text-align: center">
            <asp:Button runat="server" Text="Save" CssClass="btn btn-primary" ID="btnsave_Treatment" OnClick="btnsave_Click" />
            <asp:Button runat="server" Text="Cancel" CssClass="btn btn-danger" ID="btncancel_Treatment" />

        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-12" style="text-align: center">
            <asp:GridView ID="gvTreatment" runat="server" OnRowCommand="gvTreatment_RowCommand" AutoGenerateColumns="False" Width="1172px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
                    
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbledit" runat="server" CommandArgument='<%#Eval("PatientTreatment_ID")%>' CommandName="cmdedit">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                   


                    <asp:BoundField HeaderText="Treatment Comments" DataField="TreatmentComments" />
                    
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left"/>
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
