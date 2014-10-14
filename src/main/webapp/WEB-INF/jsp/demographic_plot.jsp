<%--
    Document   : demographic_plot
    Author     : Andrey Svininykh (svininykh@gmail.com)
    Copyright  : Nord Trading Network
    License    : Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0.html)
--%>

<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<stripes:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
                       title="Demographic Indicator Plot"
                       pageid="demographic_indicator_plot">
    <stripes:layout-component name="flot.script">
    </stripes:layout-component>

    <stripes:layout-component name="button.return">
        <sdynattr:link href="/Presentation.action"
                       class="ui-btn ui-corner-all ui-icon-home ui-btn-icon-notext">
            <stripes:label name="label.home" />
        </sdynattr:link>            
        <sdynattr:link href="/DemographicTable.action"
                       data-direction="reverse"
                       data-role="button"
                       data-icon="table">
            <stripes:label name="label.table" />
        </sdynattr:link>         
    </stripes:layout-component>

    <stripes:layout-component name="header.title">
        <stripes:label name="label.DemographicIndicator.plot" />
    </stripes:layout-component>

    <stripes:layout-component name="button.action">
    </stripes:layout-component>

    <stripes:layout-component name="content">
        <stripes:errors />
        <stripes:messages />
        <div data-role="collapsible" data-collapsed-icon="carat-d" data-expanded-icon="carat-u">
            <script type="text/javascript" charset="utf-8">
                $(document).ready(function () {
                    var birthrate = ${actionBean.dataBirthrate};
                    var lable_birthrate = "${actionBean.getLocalizationKey('label.Birthrate')}";
                    var mortality = ${actionBean.dataMortality};
                    var lable_mortality = "${actionBean.getLocalizationKey('label.Mortality')}";
                    $.plot('#birthrate_mortality', [
                        {
                            label: lable_birthrate,
                            data: birthrate,
                            bars: {show: true, barWidth: 0.6, fill: 0.8},
                            color: "#f60"},
                        {
                            label: lable_mortality,
                            data: mortality,
                            bars: {show: true, barWidth: 0.6, fill: 0.8},
                            color: "#444"}
                    ]);
                });
            </script>

            <h2><stripes:label name="label.plot.BirthrateMortalityByYears" /></h2>
            <div style="padding: 10px;">
                <div id="birthrate_mortality" style="width:512px;height:256px"></div>
            </div>
        </div>
        <div data-role="collapsible" data-collapsed-icon="carat-d" data-expanded-icon="carat-u">
            <script type="text/javascript" charset="utf-8">
                $(document).ready(function () {
                    var marriage = ${actionBean.dataMarriage};
                    var lable_marriage = "${actionBean.getLocalizationKey('label.Marriage')}";
                    var divorce = ${actionBean.dataDivorce};
                    var lable_divorce = "${actionBean.getLocalizationKey('label.Divorce')}";
                    $.plot('#marriage_divorce', [
                        {
                            label: lable_marriage,
                            data: marriage,
                            bars: {show: true, barWidth: 0.6, fill: 0.8}},
                        {
                            label: lable_divorce,
                            data: divorce,
                            bars: {show: true, barWidth: 0.6, fill: 0.8}}
                    ]);
                });
            </script>
            <h2><stripes:label name="label.plot.MarriageDivorceByYears" /></h2>
            <div style="padding: 10px;">
                <div id="marriage_divorce" style="width:512px;height:256px"></div>
            </div>
        </div>
    </stripes:layout-component>

    <stripes:layout-component name="footer">

    </stripes:layout-component>
</stripes:layout-render>
