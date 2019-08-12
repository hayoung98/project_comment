<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs"
    Inherits="WebApplication2.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Newline CSS Template with a video background</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/fontAwesome.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 877px;
            height: 205px;
        }

        .auto-style2 {
            left: 0;
            top: 0;
        }

        .auto-style3 {
            left: -15px;
            top: 1px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="overlay"></div>
        <section class="top-part">
            <img src="img/29683063306_e8cbdab479_b-800x280.jpg" class="auto-style3">
        </section>

        <section class="cd-hero">
            <div class="cd-slider-nav">
                <nav>
                    <span class="cd-marker item-1"></span>
                    <ul>
                        <li class="selected"><a href="#0">
                            <div class="image-icon">
                                <img src="img/rrr.png">
                            </div>
                            <h6>Recommend</h6>
                        </a></li>
                        <li><a href="#0">
                            <div class="image-icon">
                                <img src="img/about-icon.png">
                            </div>
                            <h6>About</h6>
                        </a></li>
                        <li><a href="#0">
                            <div class="image-icon">
                                <img src="img/wwwee.png">
                            </div>
                            <h6>Weather</h6>
                        </a></li>
                        <li><a href="#0">
                            <div class="image-icon">
                                <img src="img/contact-icon.png">
                            </div>
                            <h6>Info.</h6>
                        </a></li>
                        <li><a href="#0">
                            <div class="image-icon">
                                <img src="img/score.png">
                            </div>
                            <h6>Score</h6>
                        </a></li>
                    </ul>
                </nav>
            </div>
            <!-- .cd-slider-nav -->

            <ul class="cd-hero-slider">

                <li class="selected">
                    <div class="heading">
                        <h1>搜尋想去的地方</h1>
                        <asp:TextBox ID="TextBox1" runat="server" Height="39px" Width="332px" BackColor="#FFFF66" BorderColor="#FFFF99"></asp:TextBox>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <ajaxToolkit:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server"
                            CompletionSetCount="40" ServiceMethod="GetCompleteList" ServicePath="AutoComplete.asmx"
                            TargetControlID="TextBox1" MinimumPrefixLength="1">
                        </ajaxToolkit:AutoCompleteExtender>
                        <asp:Button ID="Button1" runat="server" Text="搜尋" OnCommand="Button1_Click"  Font-Size="Large" ForeColor="Black" BackColor="Window"/>
                    </div>
                    <div class="cd-full-width first-slide">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="content first-content">
                                        <h4>十大景點
                                        <asp:DropDownList ID="DropDownList1" AutoPostBack="True" runat="server" Width="150" Font-Size="Large" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Selected="True"> 請選擇排名方式 </asp:ListItem>
                                            <asp:ListItem Value="hot"> 按網友人氣 </asp:ListItem>
                                            <asp:ListItem Value="score"> 按網友評分 </asp:ListItem>
                                        </asp:DropDownList>
                                            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="Gridview_Rowcommand">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:ButtonField Text="查詢" CommandName="getname" ButtonType="Button" HeaderText="景點資訊"/>
                                                </Columns>
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Width="240" />
                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#E3EAEB" />
                                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                            </asp:GridView>
                                        </h4>                                   
                                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                                            
                                            <style type="text/css">
                                                .tg {
                                                    border-collapse: collapse;
                                                    border-spacing: 0;
                                                    border-color: #aaa;
                                                }

                                                    .tg td {
                                                        font-family: Arial, sans-serif;
                                                        font-size: 14px;
                                                        padding: 10px 5px;
                                                        border-style: solid;
                                                        border-width: 0px;
                                                        overflow: hidden;
                                                        word-break: normal;
                                                        border-top-width: 1px;
                                                        border-bottom-width: 1px;
                                                        border-color: #aaa;
                                                        color: #333;
                                                        background-color: #fff;
                                                    }

                                                    .tg th {
                                                        font-family: Arial, sans-serif;
                                                        font-size: 14px;
                                                        font-weight: normal;
                                                        padding: 10px 5px;
                                                        border-style: solid;
                                                        border-width: 0px;
                                                        overflow: hidden;
                                                        word-break: normal;
                                                        border-top-width: 1px;
                                                        border-bottom-width: 1px;
                                                        border-color: #aaa;
                                                        color: #fff;
                                                        background-color: #f38630;
                                                    }

                                                    .tg .tg-in7h {
                                                        font-size: 22px;
                                                        font-family: "Times New Roman", Times, serif !important;
                                                        ;
                                                        background-color: #ffcb2f;
                                                        color: #000000;
                                                        border-color: inherit;
                                                        text-align: center;
                                                        vertical-align: top
                                                    }

                                                    .tg .tg-g30d {
                                                        background-color: #FCFBE3;
                                                        border-color: inherit;
                                                        font-size: 24px;
                                                        text-align: center;
                                                        vertical-align: top
                                                    }

                                                    .tg .tg-c3ow {
                                                        border-color: inherit;
                                                        color: #fe0000;
                                                        font-size: 22px;
                                                        text-align: center;
                                                        vertical-align: top
                                                    }

                                                    .tg .tg-p8sp {
                                                        font-size: 22px;
                                                        border-color: inherit;
                                                        text-align: center;
                                                        vertical-align: top
                                                    }
                                            </style>
                                            <table class="tg" align="center" style="undefined; table-layout: fixed; width: 570px">
                                                <colgroup>
                                                    <col style="width: 80px">
                                                    <col style="width: 330px">
                                                    <col style="width: 80px">
                                                    <col style="width: 80px">
                                                </colgroup>
                                                <tr>
                                                    <th class="tg-in7h">排名</th>
                                                    <th class="tg-in7h">景點名稱</th>
                                                    <th class="tg-in7h">人氣</th>
                                                    <th class="tg-in7h">評分</th>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">1</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label31" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label41" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label71" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">2</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label32" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label42" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label72" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">3</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label33" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label43" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label73" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">4</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label34" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label44" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label74" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">5</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label35" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label45" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label75" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">6</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label36" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label46" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label76" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">7</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label37" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label47" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label77" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">8</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label38" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label48" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label78" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">9</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label39" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label49" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label79" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">10</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label40" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label50" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label80" runat="server"></asp:Label></td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel ID="Panel2" runat="server" Visible="false">
                                            <style type="text/css">
                                                .tg {
                                                    border-collapse: collapse;
                                                    border-spacing: 0;
                                                    border-color: #aaa;
                                                }

                                                    .tg td {
                                                        font-family: Arial, sans-serif;
                                                        font-size: 14px;
                                                        padding: 10px 5px;
                                                        border-style: solid;
                                                        border-width: 0px;
                                                        overflow: hidden;
                                                        word-break: normal;
                                                        border-top-width: 1px;
                                                        border-bottom-width: 1px;
                                                        border-color: #aaa;
                                                        color: #333;
                                                        background-color: #fff;
                                                    }

                                                    .tg th {
                                                        font-family: Arial, sans-serif;
                                                        font-size: 14px;
                                                        font-weight: normal;
                                                        padding: 10px 5px;
                                                        border-style: solid;
                                                        border-width: 0px;
                                                        overflow: hidden;
                                                        word-break: normal;
                                                        border-top-width: 1px;
                                                        border-bottom-width: 1px;
                                                        border-color: #aaa;
                                                        color: #fff;
                                                        background-color: #f38630;
                                                    }

                                                    .tg .tg-in7h {
                                                        font-size: 22px;
                                                        font-family: "Times New Roman", Times, serif !important;
                                                        ;
                                                        background-color: #ffcb2f;
                                                        color: #000000;
                                                        border-color: inherit;
                                                        text-align: center;
                                                        vertical-align: top
                                                    }

                                                    .tg .tg-g30d {
                                                        background-color: #FCFBE3;
                                                        border-color: inherit;
                                                        font-size: 24px;
                                                        text-align: center;
                                                        vertical-align: top
                                                    }

                                                    .tg .tg-c3ow {
                                                        border-color: inherit;
                                                        color: #fe0000;
                                                        font-size: 22px;
                                                        text-align: center;
                                                        vertical-align: top
                                                    }

                                                    .tg .tg-p8sp {
                                                        font-size: 22px;
                                                        border-color: inherit;
                                                        text-align: center;
                                                        vertical-align: top
                                                    }
                                            </style>
                                            <table class="tg" align="center" style="undefined; table-layout: fixed; width: 570px">
                                                <colgroup>
                                                    <col style="width: 80px">
                                                    <col style="width: 330px">
                                                    <col style="width: 80px">
                                                    <col style="width: 80px">
                                                </colgroup>
                                                <tr>
                                                    <th class="tg-in7h">排名</th>
                                                    <th class="tg-in7h">景點名稱</th>
                                                    <th class="tg-in7h">評分</th>
                                                    <th class="tg-in7h">人氣</th>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">1</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label51" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label61" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label81" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">2</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label52" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label62" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label82" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">3</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label53" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label63" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label83" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">4</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label54" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label64" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label84" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">5</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label55" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label65" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label85" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">6</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label56" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label66" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label86" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">7</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label57" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label67" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label87" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">8</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label58" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label68" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label88" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">9</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label59" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label69" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label89" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tg-p8sp">10</td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label60" runat="server"></asp:Label></td>
                                                    <td class="tg-c3ow">
                                                        <asp:Label ID="Label70" runat="server"></asp:Label></td>
                                                    <td class="tg-g30d">
                                                        <asp:Label ID="Label90" runat="server"></asp:Label></td>
                                                </tr>
                                            </table>
                                        </asp:Panel>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

                <li>
                    <div class="heading">
                        <h1>景點介紹</h1>
                    </div>
                    <div class="cd-full-width first-slide">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="content first-content">
                                        <h4>
                                            <asp:Label ID="Label1" runat="server"></asp:Label></h4>
                                        <asp:Label ID="Label_Toldescribe" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="heading">
                        <h1>天氣狀況</h1>
                    </div>
                    <div class="cd-full-width first-slide">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="content first-content">
                                        <table class="auto-style1">
                                            <tr>
                                                <td class="auto-style2">&nbsp;
                                                </td>
                                                <td class="auto-style3">溫度(°C)
                                                </td>
                                                <td class="auto-style3">舒適度
                                                </td>
                                                <td class="auto-style5">降雨機率(%)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">今晚至明(18:00~06:00)
                                                </td>
                                                <td class="auto-style3">
                                                    <asp:Label ID="Label_tem1" runat="server" ForeColor="#CC0000">
                                                    </asp:Label>
                                                </td>
                                                <td class="auto-style5">
                                                    <asp:Label ID="Label_comfort1" runat="server" ForeColor="#CC0000">
                                                    </asp:Label>
                                                </td>
                                                <td class="auto-style5">
                                                    <asp:Label ID="Label_rain1" runat="server" ForeColor="#CC0000">
                                                    </asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">明日白天(06:00~18:00)
                                                </td>
                                                <td class="auto-style3">
                                                    <asp:Label ID="Label_tem2" runat="server" ForeColor="#CC0000">
                                                    </asp:Label>
                                                </td>
                                                <td class="auto-style5">
                                                    <asp:Label ID="Label_comfort2" runat="server" ForeColor="#CC0000">
                                                    </asp:Label>
                                                </td>
                                                <td class="auto-style5">
                                                    <asp:Label ID="Label_rain2" runat="server" ForeColor="#CC0000">
                                                    </asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">明日晚上(18:00~06:00)
                                                </td>
                                                <td class="auto-style3">
                                                    <asp:Label ID="Label_tem3" runat="server" ForeColor="#CC0000">
                                                    </asp:Label>
                                                </td>
                                                <td class="auto-style5">
                                                    <asp:Label ID="Label_comfort3" runat="server" ForeColor="#CC0000">
                                                    </asp:Label>
                                                </td>
                                                <td class="auto-style5">
                                                    <asp:Label ID="Label_rain3" runat="server" ForeColor="#CC0000">
                                                    </asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>紫外線
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label_UVI" runat="server" ForeColor="#CC0000">
                                                    </asp:Label>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="heading">
                        <h1>相關資訊</h1>
                    </div>
                    <div class="cd-full-width first-slide">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="content first-content">
                                        <h4></h4>
                                        <h4>地址</h4>
                                        <br>
                                            <asp:Label ID="Label_ADD" runat="server"></asp:Label>
                                        </br>
                                        <h4></h4>
                                        <h4>停車資訊</h4>
                                        <br>
                                            <asp:Label ID="Label_Parking" runat="server"></asp:Label>
                                        </br>
                                        <h4></h4>
                                        <h4>電話</h4>
                                        <br>
                                            <asp:Label ID="Label_Tel" runat="server"></asp:Label>
                                        </br>
                                        <h4></h4>
                                        <h4>營業時間</h4>
                                        <br>
                                            <asp:Label ID="Label_Opentime" runat="server"></asp:Label>
                                        </br>
                                        <h4></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

                <li>
                    <div class="heading">
                        <h1>旅遊指數</h1>
                    </div>
                    <div class="cd-full-width first-slide">
                    </div>
                </li>




            </ul>
        </section>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

    </form>

</body>
</html>
