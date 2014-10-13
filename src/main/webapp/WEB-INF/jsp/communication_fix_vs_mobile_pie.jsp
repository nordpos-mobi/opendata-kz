<%--
    Document   : communication_fixphone_pie
    Author     : Andrey Svininykh (svininykh@gmail.com)
    Copyright  : Nord Trading Network
    License    : Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0.html)
--%>

<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<stripes:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
                       title="Fix vs Mobile Subscribers Pie"
                       pageid="fixvsmobile_subscriber_pie">
    <stripes:layout-component name="flot.script">        
    </stripes:layout-component>

    <stripes:layout-component name="button.return">
        <sdynattr:link href="/Presentation.action"
                       class="ui-btn ui-corner-all ui-icon-home ui-btn-icon-notext">
            <stripes:label name="label.home" />
        </sdynattr:link>
        <sdynattr:link href="/CommunicationMenu.action"
                       data-direction="reverse"
                       class="ui-btn ui-corner-all ui-btn-icon-left ui-icon-bars">
            <stripes:label name="label.menu" />
        </sdynattr:link>        
    </stripes:layout-component>

    <stripes:layout-component name="header.title">
        <stripes:label name="label.FixVsMobileSubscriber.pie" />
    </stripes:layout-component>

    <stripes:layout-component name="button.action">
    </stripes:layout-component>

    <stripes:layout-component name="content">
        <div data-role="collapsible" data-collapsed-icon="carat-d" data-expanded-icon="carat-u">
            <script type="text/javascript">
                $(document).ready(function () {
                    var data = [
                        {label: "${actionBean.getLocalizationKey('label.FixSubscribers')}", data: ${actionBean.fixPhoneSubscribers}},
                        {label: "${actionBean.getLocalizationKey('label.MobileSubscribers')}", data: ${actionBean.mobilePhoneSubscribers}}];
                    var placeholder = $("#fixvsmobile_phone_subscriber");
                    $.plot(placeholder, data, {
                        series: {
                            pie: {
                                show: true,
                                radius: 1,
                                label: {
                                    show: true,
                                    radius: 3 / 4,
                                    formatter: function (label, series) {
                                        return '<div>' + Math.round(series.percent) + '%<br>(' + series.data[0][1] + ')</div>';
                                    },
                                    background: {
                                        opacity: 0.5
                                    }
                                }
                            }
                        },
                        legend: {
                            show: true,
                            position: "s"
                        }
                    });
                    placeholder.append("<div style='position:absolute;left:0px;top:0px;color:#666;font-size:medium'>${actionBean.labelMonth}&nbsp;${actionBean.year}</div>");
                });
            </script>
            <h2><stripes:label name="label.PhoneSubscriber.pie" /></h2>
            <div style="padding: 10px;">
                <div id="fixvsmobile_phone_subscriber" style="width:256px;height:256px"></div>
            </div>
        </div>
<div data-role="collapsible" data-collapsed-icon="carat-d" data-expanded-icon="carat-u">
            <script type="text/javascript">
                $(document).ready(function () {
                    var data = [
                        {label: "${actionBean.getLocalizationKey('label.FixInetSubscribers')}", data: ${actionBean.fixInetSubscribers}},
                        {label: "${actionBean.getLocalizationKey('label.MobileInetSubscribers')}", data: ${actionBean.mobileInetSubscribers}}];
                    var placeholder = $("#fixvsmobile_inet_subscriber");
                    $.plot(placeholder, data, {
                        series: {
                            pie: {
                                show: true,
                                radius: 1,
                                label: {
                                    show: true,
                                    radius: 3 / 4,
                                    formatter: function (label, series) {
                                        return '<div>' + Math.round(series.percent) + '%<br>(' + series.data[0][1] + ')</div>';
                                    },
                                    background: {
                                        opacity: 0.5
                                    }
                                }
                            }
                        },
                        legend: {
                            show: true,
                            position: "s"
                        }
                    });
                    placeholder.append("<div style='position:absolute;left:0px;top:0px;color:#666;font-size:medium'>${actionBean.labelMonth}&nbsp;${actionBean.year}</div>");
                });
            </script>
            <h2><stripes:label name="label.InetSubscriber.pie" /></h2>
            <div style="padding: 10px;">
                <div id="fixvsmobile_inet_subscriber" style="width:256px;height:256px"></div>
            </div>
        </div>            
    </stripes:layout-component>

    <stripes:layout-component name="footer">

    </stripes:layout-component>
</stripes:layout-render>
