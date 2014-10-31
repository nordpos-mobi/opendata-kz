<%--
    Document   : demographic_view
    Author     : Andrey Svininykh (svininykh@gmail.com)
    Copyright  : Nord Trading Network
    License    : Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0.html)
--%>

<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<stripes:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
                       title="Demographic Indicator Table"
                       pageid="DemographicIndicatorTable">

    <stripes:layout-component name="button.return">
        <sdynattr:link href="/Presentation.action"
                       class="ui-btn ui-corner-all ui-icon-home ui-btn-icon-notext">
            <fmt:message key="label.home" />
        </sdynattr:link>                
    </stripes:layout-component>

    <stripes:layout-component name="header.title">
        <fmt:message key="label.DemographicIndicator.table" />
    </stripes:layout-component>

    <stripes:layout-component name="button.action">
        <sdynattr:link href="/DemographicPlot.action"
                       data-role="button"
                       data-icon="bar-chart-o"
                       data-prefetch="true">
            <fmt:message key="label.plot" />
        </sdynattr:link>         
    </stripes:layout-component>

    <stripes:layout-component name="content">
        <stripes:errors />
        <stripes:messages />
        <table data-role="table" 
               id="demographicIndicator" 
               data-mode="columntoggle" 
               class="ui-body-d ui-shadow table-stripe ui-responsive" 
               data-column-btn-theme="b" 
               data-column-btn-text="${actionBean.getLocalizationKey("label.column.display")}" 
               data-column-popup-theme="a">
            <thead>
                <tr class="ui-bar-d">
                    <th><fmt:message key="label.Year" /></th>
                    <th data-priority="1"><fmt:message key="label.Birthrate" /></th>             
                    <th data-priority="2"><fmt:message key="label.Mortality" /></th>
                    <th data-priority="1">
                        <abbr title="${actionBean.getLocalizationKey("label.abbr.Marriage")}">
                            <c:out value="${actionBean.getLocalizationKey('label.Marriage')}"/> 
                        </abbr>
                    </th>
                    <th data-priority="2">
                        <abbr title="${actionBean.getLocalizationKey("label.abbr.Divorce")}">
                            <c:out value="${actionBean.getLocalizationKey('label.Divorce')}"/>                         
                        </abbr>
                    </th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${demographicIndicators}" var="indicator">
                    <tr>
                        <th>
                            <c:out value="${indicator.year}"/>
                        </th>
                        <td>
                            <fmt:formatNumber value="${indicator.birthrate}"
                                              type="NUMBER"
                                              pattern="#,##0" />
                        </td>
                        <td>
                            <fmt:formatNumber value="${indicator.mortality}"
                                              type="NUMBER"
                                              pattern="#,##0" />
                        </td>
                        <td>
                            <fmt:formatNumber value="${indicator.marriage}"
                                              type="NUMBER"
                                              pattern="#,##0" />
                        </td>
                        <td>
                            <fmt:formatNumber value="${indicator.divorce}"
                                              type="NUMBER"
                                              pattern="#,##0" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </stripes:layout-component>

    <stripes:layout-component name="footer">

    </stripes:layout-component>
</stripes:layout-render>
