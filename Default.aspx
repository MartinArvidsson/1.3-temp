<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KonverteraTemperaturer.Default" Viewstatemode="Disabled"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Beräkna temperatur</h1>
    <h2>Starttemperatur:</h2>
        <asp:TextBox ID="StartTempBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="NoEmptyStartTemp" runat="server" ErrorMessage="Fältet kan inte vara tomt" ControlToValidate="StartTempBox" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="ValidationOfStartTemp" runat="server" ErrorMessage="Ange ett tal!" Display="Dynamic" Type="Integer"  ControlToValidate="StartTempBox" Operator="DataTypeCheck"></asp:CompareValidator>



    <h2>Sluttemperatur:</h2>
        <asp:TextBox ID="EndTempTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="NoEmptyEndTemp" runat="server" ErrorMessage="Fältet kan inte vara tomt" ControlToValidate="EndTempTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="ValidationOfEndTemp" runat="server" ErrorMessage="Ange ett tal!" Display="Dynamic" Type="Integer"  ControlToValidate="EndTempTextBox" Operator="DataTypeCheck"></asp:CompareValidator>
        <asp:CompareValidator ID="ValidationGreaterThanStart" runat="server" ErrorMessage="Sluttemp måste vara större än Starttemperaturen." Type="Integer" Display="Dynamic" ControlToValidate="EndTempTextBox" Operator="GreaterThan" ControlToCompare="StartTempBox"></asp:CompareValidator>


    <h2>Temperatursteg värde mellan 1-100:</h2>
        <asp:TextBox ID="TempStepBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="NoEmptyTempStep" runat="server" ErrorMessage="Fältet kan inte vara tomt" ControlToValidate="TempStepBox" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="ValidationOfTempStep" runat="server" ErrorMessage="Ange ett tal!" Display="Dynamic" Type="Integer"  ControlToValidate="TempStepBox" ValueToCompare="0" Operator="GreaterThan"></asp:CompareValidator>
        <asp:RangeValidator ID="ValidationOfRangeTempStep" runat="server" ErrorMessage="Måste vara inom intervallet 1-100" Display="Dynamic" ControlToValidate="TempStepBox" MaximumValue="100" MinimumValue="1" Type="Integer"></asp:RangeValidator>



    <h2>Typ av konvertering:</h2>
        <asp:RadioButton ID="CelToFarButton" runat="server" Text="Celsius till farenheit" GroupName="KonvertButton" Checked="True" />
        <asp:RadioButton ID="FarToCelButton" runat="server" Text="Farenheit till celsius" GroupName="KonvertButton" />
        <asp:Button ID="CalculateButton" runat="server" Text="Konvertera!" OnClick="CalculateButton_Click" />
    </div>
    </form>
</body>
</html>
