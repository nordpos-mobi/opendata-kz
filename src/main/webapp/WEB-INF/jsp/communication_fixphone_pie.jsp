<%--
    Document   : communication_fixphone_pie
    Author     : Andrey Svininykh (svininykh@gmail.com)
    Copyright  : Nord Trading Network
    License    : Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0.html)
--%>

<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<stripes:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
                       title="Fix Phone Subscribers Pie"
                       pageid="fixphone_subscriber_pie">
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
        <stripes:label name="label.FixPhoneSubscriber.pie" />
    </stripes:layout-component>

    <stripes:layout-component name="button.action">
    </stripes:layout-component>

    <stripes:layout-component name="content">

        <script type="text/javascript">
            $(document).ready(function () {
                var data = [
                    {label: "${actionBean.getLocalizationKey('label.InetSubscribers')}", data: ${actionBean.fixInetSubscribers}},
                    {label: "${actionBean.getLocalizationKey('label.NoInetSubscribers')}", data: ${actionBean.fixPhoneSubscribers} - ${actionBean.fixInetSubscribers}}];
                var placeholder = $("#fix_phone_subscriber");
                $.plot(placeholder, data, {
                    series: {
                        pie: {
                            show: true,
                            radius: 1,
                            label: {
                                show: true,
                                radius: 2 / 4,
                                formatter: function (label, series) {
                                    return '<div>' + Math.round(series.percent) + '%<br>(' + series.data[0][1] + ')</div>';
                                },
                                background: {
                                    opacity: 1
                                }
                            }
                        }
                    },
                    legend: {
                        show: true,
                        position: "se"
                    }
                });
                placeholder.append("<div style='position:absolute;left:0px;top:0px;color:#666;font-size:medium'>${actionBean.labelMonth}&nbsp;${actionBean.year}</div>");
            });
        </script>
        <div style="padding: 10px;">
            <div id="fix_phone_subscriber" style="width:512px;height:256px"></div>
        </div>
    </stripes:layout-component>

    <stripes:layout-component name="footer">

    </stripes:layout-component>
</stripes:layout-render>
