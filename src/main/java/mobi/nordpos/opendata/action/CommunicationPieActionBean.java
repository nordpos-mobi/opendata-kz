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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.math.BigInteger;
import mobi.nordpos.opendata.model.CommunicationIndicator;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.validation.Validate;

/**
 * @author Andrey Svininykh <svininykh@gmail.com>
 */
public class CommunicationPieActionBean extends CommunicationBaseActionBean {

    private static final String FIX_PHONE_PIE = "/WEB-INF/jsp/communication_fixphone_pie.jsp";

    @Validate(required = true)
    int month;
    @Validate(required = true)
    int year;

    @DefaultHandler
    public Resolution plot() {
        return new ForwardResolution(FIX_PHONE_PIE);
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

    public String getDataFixPhoneSubscriber() {
        BigInteger totalPhoneInet = BigInteger.ZERO;
        BigInteger totalPhone = BigInteger.ZERO;

        for (CommunicationIndicator indicator : getContext().getCommunicationIndicators()) {
            if (indicator.getYear() == getYear() && indicator.getMonth() == getMonth()) {
                if (indicator.getType().equals(CommunicationIndicator.CommunicationIndicatorType.FIX_TOTAL_INET_SUBSCRIBER)) {
                    totalPhoneInet = indicator.getValue();
                } else if (indicator.getType().equals(CommunicationIndicator.CommunicationIndicatorType.FIX_PHONE_SUBSCRIBER)) {
                    totalPhone = indicator.getValue();
                }
            }
        }

        JsonArray dataArray = new JsonArray();
        JsonObject joInetSubscriber = new JsonObject();
        joInetSubscriber.addProperty("label", getLocalizationKey("label.FixInetSubscribers"));
        joInetSubscriber.addProperty("data", totalPhoneInet);
        dataArray.add(joInetSubscriber);
        JsonObject joNoInetSubscriber = new JsonObject();
        joNoInetSubscriber.addProperty("label", getLocalizationKey("label.NoFixInetSubscribers"));
        joNoInetSubscriber.addProperty("data", totalPhone.subtract(totalPhoneInet));
        dataArray.add(joNoInetSubscriber);
        Gson gson = new GsonBuilder().create();
        String s = gson.toJson(dataArray);

        return s;
    }

}
