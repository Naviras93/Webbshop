<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="ShoppingCart.aspx.cs" Inherits="Webbshop.Public_Pages.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div style="margin-left:960px">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">[Logga ut]</asp:LinkButton>
    </div>
    <h2>Kassa</h2>
    <div>
        <asp:Label ID="Label9" runat="server" ForeColor="Green" Font-Size="X-Large"></asp:Label>

    </div>
    <div>
    <table>
        <tr>
            <td>
                <asp:GridView ID="GridView2" AutoGenerateColumns="False" runat="server" ShowHeader="True" Width="483px" BorderStyle="None" >
                    <Columns>
                        <asp:TemplateField HeaderText="Kundvagen" HeaderStyle-HorizontalAlign="Left" FooterStyle-BorderStyle="Outset" HeaderStyle-BorderStyle="NotSet">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image1" ImageUrl='<%# Eval("Image") %>' runat="server" Width="100px" />
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td style ="width: 200px;">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label><br />
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("ItemID") %>'></asp:Label>
                                                    </td>
                                                    <td style="text-align:right">
                                                       
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>' Font-Size="X-Large" ForeColor="#FF3399"></asp:Label>
                                                        <asp:Label ID="Label4" runat="server" Text=":-" Font-Size="X-Large" ForeColor="#FF3399"></asp:Label>
                                                       <br />
                                                        <asp:Label ID="Label5" runat="server" Text="Antal: "></asp:Label>
                                                        <asp:TextBox ID="TextBox1" runat="server" Width="30" Text="1" ></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
             
            </td>
        </tr>
    </table>
   
    </div>
    <div style="margin-left:310px;">
        <asp:Label ID="Label6" runat="server" Text="Total: ">
        </asp:Label><asp:Label ID="Label7" runat="server" ForeColor="#FF3399"  Font-Size="X-Large"></asp:Label>
        <asp:Label ID="Label10" runat="server" Text=":-" ForeColor="#FF3399"  Font-Size="X-Large"></asp:Label>
         </div>
    <div style="margin-top:28px; position:absolute ">
        <asp:Label ID="Label3" runat="server" Text="Leverans Adress: "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Width="185px"></asp:TextBox>
    </div>
    <div style="margin-left:330px; margin-top:20px">
        <asp:Button ID="Button1" runat="server" Text="Beställ" OnClick="Button1_Click" BorderStyle="None" Height="37px" Width="150px" />
    </div>
   
</asp:Content>