<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Webbshop.Products" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="searchbar">
    <div class="search" id="category">
        <asp:Label ID="Label2" runat="server" Text="Label">Välj Kategori: </asp:Label><br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="1">Skor</asp:ListItem>
            <asp:ListItem Value="2">Väskor</asp:ListItem>
            
            
        </asp:DropDownList>
    </div>
    <div class="search" id="color">
        <asp:Label ID="Label4" runat="server" Text="Label">Välj Färg: </asp:Label><br />
     <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Pink">Rosa</asp:ListItem>
            <asp:ListItem Value="Blue">Blå</asp:ListItem>
            <asp:ListItem Value="White">Vit</asp:ListItem>
            <asp:ListItem Value="Black">Svart</asp:ListItem>
            <asp:ListItem Value="Brown">Brun</asp:ListItem>
            <asp:ListItem Value="Gray">Grå</asp:ListItem>
            <asp:ListItem Value="Orange">Orange</asp:ListItem>
            <asp:ListItem Value="Gold">Guld</asp:ListItem>
           
     </asp:DropDownList>   

    </div>
    <div class="search" id="price">
      <asp:Label ID="Label3" runat="server" Text="Label">Välj Pris: </asp:Label><br />
      <asp:DropDownList ID="DropDownList3" runat="server">
          <asp:ListItem ></asp:ListItem>
          <asp:ListItem Value="1">&lt; 200 Sek</asp:ListItem>
          <asp:ListItem Value="2">200 Sek&lt; Pris &lt;500 Sek</asp:ListItem>
          <asp:ListItem Value="3">500 sek &lt;</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="search" id="sort">
        <asp:Label ID="Label1" runat="server" Text="Label">Sortera efter: </asp:Label><br />
        <asp:DropDownList ID="DropDownList4" runat="server">
            <asp:ListItem ></asp:ListItem>
            <asp:ListItem Value="ASC">Lägsta Pris</asp:ListItem>
            <asp:ListItem Value="DESC">Högsta Pris</asp:ListItem>
            
        </asp:DropDownList>
        <div style="margin-top:20px;">
        <asp:Button ID="Button1" runat="server" Text="Sök" OnClick="Button1_Click1" BackColor="LightGray" BorderStyle="None" Height="35px" Width="120px" />
        </div>
        <div>
            <br />
            Välkommen 
            <asp:Label ID="Label5" runat="server"></asp:Label>

            !<br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">[Logga ut]</asp:LinkButton>

        </div>
    </div>
   
    </div>

<div id="productList">
      <div>
    <table>
        <tr>
            <td class="auto-style2">
                <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" ShowHeader="False" Width="483px" BorderStyle="None"  GridLines="None" AllowSorting="true">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image1" ImageUrl='<%# Eval("Image") %>' runat="server" Width="200px" />
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td style ="width:250px;">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                                    </td>
                                                    <td style="text-align:center">
                                                       
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>' Font-Size="XX-Large" ForeColor="#FF3399"></asp:Label>
                                                        <asp:Label ID="Label4" runat="server" Text=":-" Font-Size="XX-Large" ForeColor="#FF3399"></asp:Label>
                                                       <br />
                                                        <asp:Button ID="Button2" CommandArgument='<%# Eval("ItemId") %>' OnClick="Button2_Click" runat="server" Text="Lägg i kundvagnen"  Height="40" Width="140" BorderStyle="None" BackColor="LightGray" />
                                                   
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
</div>

</asp:Content>
