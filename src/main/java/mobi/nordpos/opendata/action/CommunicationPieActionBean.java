/**
 * Copyright (c) 2012-2014 Nord Trading Network.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package mobi.nordpos.opendata.action;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import mobi.nordpos.opendata.model.CommunicationIndicator;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidationErrors;
import net.sourceforge.stripes.validation.ValidationMethod;

/**
 * @author Andrey Svininykh <svininykh@gmail.com>
 */
public class CommunicationPieActionBean extends CommunicationBaseActionBean {

    private static final String FIX_PHONE_PIE = "/WEB-INF/jsp/communication_fixphone_pie.jsp";
    private static final String MOBILE_PHONE_PIE = "/WEB-INF/jsp/communication_mobile_pie.jsp";
    private static final String FIX_VS_MOBILE_PIE = "/WEB-INF/jsp/communication_fix_vs_mobile_pie.jsp";

    @Validate(required = true, minvalue = 0, maxvalue = 6)
    int month;
    @Validate(required = true, minvalue = 2014, maxvalue = 2014)
    int year;

    @DefaultHandler
    public Resolution fixVsMobile() {
        return new ForwardResolution(FIX_VS_MOBILE_PIE);
    }

    public Resolution fix() {
        return new ForwardResolution(FIX_PHONE_PIE);
    }

    public Resolution mobile() {
        return new ForwardResolution(MOBILE_PHONE_PIE);
    }

    @ValidationMethod(on = {"fix", "fixVsMobile"})
    public void validateFixIndicatorList(ValidationErrors errors) {
        if (getContext().getCommunicationFixIndicators() == null) {
            List<CommunicationIndicator> indicators = new ArrayList<CommunicationIndicator>();
            indicators.addAll(getFixSubscribers());
            getContext().setCommunicationFixIndicators(indicators);
        }
    }

    @ValidationMethod(on = {"mobile", "fixVsMobile"})
    public void validateMobileIndicatorList(ValidationErrors errors) {
        if (getContext().getCommunicationMobileIndicators() == null) {
            List<CommunicationIndicator> indicators = new ArrayList<CommunicationIndicator>();
            indicators.addAll(getMobileSubscribers());
            getContext().setCommunicationMobileIndicators(indicators);
        }
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public String getLabelMonth() {
        switch (getMonth()) {
            case 0:
                return getLocalizationKey("january");
            case 1:
                return getLocalizationKey("february");
            case 2:
                return getLocalizationKey("march");
            case 3:
                return getLocalizationKey("april");
            case 4:
                return getLocalizationKey("may");
            case 5:
                return getLocalizationKey("june");
            case 6:
                return getLocalizationKey("july");
            default:
                return null;
        }
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public BigInteger getFixPhoneSubscribers() {
        return getFixCommunicationIndicatorValue(
                CommunicationIndicator.CommunicationIndicatorType.FIX_PHONE_SUBSCRIBER);
    }

    public BigInteger getFixInetSubscribers() {
        return getFixCommunicationIndicatorValue(
                CommunicationIndicator.CommunicationIndicatorType.FIX_TOTAL_INET_SUBSCRIBER);
    }

    private BigInteger getFixCommunicationIndicatorValue(CommunicationIndicator.CommunicationIndicatorType type) {
        for (CommunicationIndicator indicator : getContext().getCommunicationFixIndicators()) {
            if (indicator.getYear() == getYear() && indicator.getMonth() == getMonth()) {
                if (indicator.getType().equals(type)) {
                    return indicator.getValue();
                }
            }
        }
        return BigInteger.ZERO;
    }

    public BigInteger getMobilePhoneSubscribers() {
        return getMobileCommunicationIndicatorValue(
                CommunicationIndicator.CommunicationIndicatorType.MOBILE_PHONE_SUBSCRIBER);
    }

    public BigInteger getMobileInetSubscribers() {
        return getMobileCommunicationIndicatorValue(
                CommunicationIndicator.CommunicationIndicatorType.MOBILE_HI_INET_SUBSCRIBER).add(
                        getMobileCommunicationIndicatorValue(
                                CommunicationIndicator.CommunicationIndicatorType.MOBILE_LOW_INET_SUBSCRIBER)
                );
    }

    private BigInteger getMobileCommunicationIndicatorValue(CommunicationIndicator.CommunicationIndicatorType type) {
        for (CommunicationIndicator indicator : getContext().getCommunicationMobileIndicators()) {
            if (indicator.getYear() == getYear() && indicator.getMonth() == getMonth()) {
                if (indicator.getType().equals(type)) {
                    return indicator.getValue();
                }
            }
        }
        return BigInteger.ZERO;
    }
}
