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
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import mobi.nordpos.opendata.model.CommunicationIndicator;
import mobi.nordpos.opendata.model.CommunicationIndicator.CommunicationIndicatorType;
import net.sourceforge.stripes.validation.ValidationErrors;
import net.sourceforge.stripes.validation.ValidationMethod;

/**
 * @author Andrey Svininykh <svininykh@gmail.com>
 */
public abstract class CommunicationBaseActionBean extends BaseActionBean {

    String sMonth[] = {"january", "february", "march", "april", "may", "june", "july"};

    public List<CommunicationIndicator> getFixPhoneSubscribers() {
        try {
            return getCommunicationIndicatorList("fixstat", 2014, CommunicationIndicatorType.FIX_PHONE_SUBSCRIBER);
        } catch (IOException ex) {
            return null;
        }
    }

    public List<CommunicationIndicator> getFixInetSubscribers() {
        try {
            return getCommunicationIndicatorList("fixstat", 2014, CommunicationIndicatorType.FIX_TOTAL_INET_SUBSCRIBER);
        } catch (IOException ex) {
            return null;
        }
    }

    public List<CommunicationIndicator> getMobilePhoneSubscribers() {
        try {
            return getCommunicationIndicatorList("comstat", 2014, CommunicationIndicatorType.MOBILE_PHONE_SUBSCRIBER);
        } catch (IOException ex) {
            return null;
        }
    }

    private List<CommunicationIndicator> getCommunicationIndicatorList(String name, int year, CommunicationIndicatorType type) throws MalformedURLException, IOException {
        JsonObject joRequest = new JsonObject();
        joRequest.addProperty("size", 1);

        JsonObject joMatch = new JsonObject();
        int id;
        switch (type) {
            case FIX_PHONE_SUBSCRIBER:
                id = 3;
                break;
            case FIX_TOTAL_INET_SUBSCRIBER:
                id = 5;
                break;
            case MOBILE_PHONE_SUBSCRIBER:
                id = 2;
                break;
            case MOBILE_HI_INET_SUBSCRIBER:
                id = 4;
                break;
            case MOBILE_LOW_INET_SUBSCRIBER:
                id = 3;
                break;
            default:
                return null;
        }
        joMatch.addProperty("id", id);
        JsonArray jaMust = new JsonArray();
        JsonObject joCondition = new JsonObject();
        joCondition.add("match", joMatch);
        jaMust.add(joCondition);
        JsonObject joBool = new JsonObject();
        joBool.add("must", jaMust);
        JsonObject joQuery = new JsonObject();
        joQuery.add("bool", joBool);
        joRequest.add("query", joQuery);

        Gson gson = new GsonBuilder().create();

        String request = gson.toJson(joRequest);
        logger.info("joRequest: {}", request);
        String requestURL = getContext().getServletContext().getInitParameter("opendata.gateway").concat(name).concat(Integer.toString(year)).concat("?source=").concat(request);
        URL wikiRequest = new URL(requestURL);
        Scanner scanner = new Scanner(wikiRequest.openStream());
        String response = scanner.useDelimiter("\\Z").next();
        scanner.close();
        JsonElement jStatElement = new JsonParser().parse(response);

        JsonArray jStatArray = null;
        if (jStatElement.isJsonArray()) {
            jStatArray = jStatElement.getAsJsonArray();
        }

        JsonObject jStatObject = null;

        for (JsonElement element : jStatArray) {
            JsonObject object = element.getAsJsonObject();
            if (object.get("id").getAsString().equals(joMatch.get("id").getAsString())) {
                jStatObject = object;
                break;
            }
        }

        List<CommunicationIndicator> indicators = new ArrayList<CommunicationIndicator>();

        if (jStatObject != null) {
            for (int i = 0; i < sMonth.length; i++) {
                CommunicationIndicator indicator = new CommunicationIndicator();
                indicator.setType(type);
                indicator.setYear(year);
                indicator.setMonth(i);
                indicator.setValue(jStatObject.get(sMonth[i]).getAsBigDecimal().multiply(BigDecimal.valueOf(1000)).toBigInteger());
                indicators.add(indicator);
            }
        }

        return indicators;
    }

}
