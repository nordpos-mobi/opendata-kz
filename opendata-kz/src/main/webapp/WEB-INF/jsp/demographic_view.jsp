<%--
    Document   : product_view
    Author     : Andrey Svininykh (svininykh@gmail.com)
    Copyright  : Nord Trading Network
    License    : Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0.html)
--%>

<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<stripes:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
                       title="Demographic Indicator"
                       pageid="DemographicIndicator">

    <stripes:layout-component name="button.return">
        <sdynattr:link href="/Presentation.action"
                       class="ui-btn ui-corner-all ui-icon-home ui-btn-icon-notext">
            <stripes:label name="label.home" />
        </sdynattr:link>                
    </stripes:layout-component>

    <stripes:layout-component name="header.title">
        <stripes:label name="label.DemographicIndicator" />
    </stripes:layout-component>

    <stripes:layout-component name="button.action">     
    </stripes:layout-component>

    <stripes:layout-component name="content">
        <stripes:errors />
        <stripes:messages />
        <table data-role="table" 
               id="demographicIndicator" 
               data-mode="columntoggle" 
               class="ui-body-d ui-shadow table-stripe ui-responsive" 
               data-column-btn-theme="b" 
               data-column-btn-text="Columns to display..." 
               data-column-popup-theme="a">
            <thead>
                <tr class="ui-bar-d">
                    <th><stripes:label name="label.Year" /></th>
                    <th data-priority="1"><stripes:label name="label.Birthrate" /></th>             
                    <th data-priority="2"><stripes:label name="label.Mortality" /></th>
                    <th data-priority="1"><stripes:label name="label.Marriage" /></th>
                    <th data-priority="2"><stripes:label name="label.Divorce" /></th>
                        <%--<th data-priority="1"><abbr title="Rotten Tomato Rating">Rating</abbr></th>--%>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${actionBean.demographicIndicatorList}" var="indicator">
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
                        <%--<td><a href="http://en.wikipedia.org/wiki/Citizen_Kane" data-rel="external">Citizen Kane</a></td>--%>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </stripes:layout-component>

    <stripes:layout-component name="footer">

    </stripes:layout-component>
</stripes:layout-render>
