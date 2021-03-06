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
import com.google.gson.JsonPrimitive;
import java.math.BigInteger;
import mobi.nordpos.opendata.model.DemographicIndicator;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

/**
 * @author Andrey Svininykh <svininykh@gmail.com>
 */
public class DemographicPlotActionBean extends DemographicBaseActionBean {

    private static final String PLOT = "/WEB-INF/jsp/demographic_plot.jsp";

    @DefaultHandler
    public Resolution view() {
        return new ForwardResolution(PLOT);
    }

    public String getDataBirthrate() {
        JsonArray dataArray = new JsonArray();
        for (DemographicIndicator indicator : getContext().getDemographicIndicators()) {
            JsonArray ja = new JsonArray();
            ja.add(new JsonPrimitive(indicator.getYear()));
            ja.add(new JsonPrimitive(indicator.getBirthrate()));
            dataArray.add(ja);
        }

        Gson gson = new GsonBuilder().create();
        String s = gson.toJson(dataArray);

        return s;
    }

    public String getDataMortality() {
        JsonArray dataArray = new JsonArray();
        for (DemographicIndicator indicator : getContext().getDemographicIndicators()) {
            JsonArray ja = new JsonArray();
            ja.add(new JsonPrimitive(indicator.getYear()));
            ja.add(new JsonPrimitive(indicator.getMortality().negate()));
            dataArray.add(ja);
        }

        Gson gson = new GsonBuilder().create();
        String s = gson.toJson(dataArray);

        return s;
    }

    public String getDataMarriage() {
        JsonArray dataArray = new JsonArray();
        for (DemographicIndicator indicator : getContext().getDemographicIndicators()) {
            JsonArray ja = new JsonArray();
            ja.add(new JsonPrimitive(indicator.getYear()));
            ja.add(new JsonPrimitive(indicator.getMarriage()));
            dataArray.add(ja);
        }

        Gson gson = new GsonBuilder().create();
        String s = gson.toJson(dataArray);

        return s;
    }

    public String getDataDivorce() {
        JsonArray dataArray = new JsonArray();
        for (DemographicIndicator indicator : getContext().getDemographicIndicators()) {
            JsonArray ja = new JsonArray();
            ja.add(new JsonPrimitive(indicator.getYear()));
            ja.add(new JsonPrimitive(indicator.getDivorce().negate()));
            dataArray.add(ja);
        }

        Gson gson = new GsonBuilder().create();
        String s = gson.toJson(dataArray);

        return s;
    }

}
