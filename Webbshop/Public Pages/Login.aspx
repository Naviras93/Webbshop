<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Webbshop.Login" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div>
   <h1>Logga in</h1>
        <div>

            <table class="auto-style1">

                <tr>
                    <td class="auto-style12">Användarnamn</td>
                    <td class="auto-style13">
                        <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 0px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Lösenord</td>
                    <td class="auto-style13">
                        <asp:TextBox ID="TextBox2" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">

                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                    
                     </td>
                    <td class="auto-style6">
                        <asp:Button ID="Button1" runat="server" Text="Inloggning" Width="85px" Height="34px" OnClick="Button1_Click" />
                        <asp:CheckBox ID="RememberMe" runat="server" OnCheckedChanged="RememberMe_CheckedChanged" style="font-weight: 700" Text="Kom ihåg mig" />
                    </td>

                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td>
                    <asp:Label ID="Label1" runat="server" Text="Label">Är du ny kund? </asp:Label>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Public Pages/Register.aspx">Registrera dig nu.</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">

                        &nbsp;</td>
                </tr>
                
            </table>

        </div>
        

            
        
       </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
    .auto-style1 {
        width: 36%;
        border-collapse: collapse;
    }
        .auto-style2 {
            width: 129px;
        }
        .auto-style5 {
            width: 105px;
            height: 53px;
        }
        .auto-style6 {
            height: 53px;
        }
        .auto-style12 {
            width: 129px;
            height: 28px;
        }
        .auto-style13 {
            height: 28px;
        }
        .auto-style14 {
            height: 53px;
            width: 129px;
        }
    </style>
</asp:Content>

