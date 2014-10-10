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
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import mobi.nordpos.opendata.model.DemographicIndicator;
import net.sourceforge.stripes.validation.ValidationErrors;
import net.sourceforge.stripes.validation.ValidationMethod;

/**
 * @author Andrey Svininykh <svininykh@gmail.com>
 */
public abstract class DemographicBaseActionBean extends BaseActionBean {

    @ValidationMethod
    public void validateDemographicIndicatorList(ValidationErrors errors) {
        if (getContext().getDemographicIndicators() == null) {
            getContext().setDemographicIndicators(getDemographicIndicatorList());
        }
    }

    private List<DemographicIndicator> getDemographicIndicatorList() {
        try {
            List<DemographicIndicator> demographicIndicators = new ArrayList<DemographicIndicator>();

            for (int year = 2003; year < 2014; year++) {
                DemographicIndicator di = getDemographicIndicator(Integer.toString(year));
                di.setYear(Integer.toString(year));
                demographicIndicators.add(di);
            }

            return demographicIndicators;
        } catch (IOException ex) {
            return null;
        }
    }

    private DemographicIndicator getDemographicIndicator(String year) throws MalformedURLException, IOException {
        String requestURL = getContext().getServletContext().getInitParameter("opendata.gateway").concat("brate_").concat(year);
        URL wikiRequest = new URL(requestURL);
        Scanner scanner = new Scanner(wikiRequest.openStream());
        String response = scanner.useDelimiter("\\Z").next();
        scanner.close();
        response = response.substring(1, response.length() - 1);
        Gson gson = new Gson();
        DemographicIndicator di = gson.fromJson(response, DemographicIndicator.class);

        return di;
    }

}
