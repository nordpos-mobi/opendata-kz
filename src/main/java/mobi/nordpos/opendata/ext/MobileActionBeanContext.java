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
package mobi.nordpos.opendata.ext;

import java.util.List;
import mobi.nordpos.opendata.model.CommunicationIndicator;
import mobi.nordpos.opendata.model.DemographicIndicator;
import net.sourceforge.stripes.action.ActionBeanContext;

/**
 * @author Andrey Svininykh <svininykh@gmail.com>
 */
public class MobileActionBeanContext extends ActionBeanContext {

    public List<DemographicIndicator> getDemographicIndicators() {
        return (List<DemographicIndicator>) getRequest().getSession().getAttribute("demographicIndicators");
    }

    public void setDemographicIndicators(List<DemographicIndicator> demographicIndicators) {
        getRequest().getSession().setAttribute("demographicIndicators", demographicIndicators);
    }

    public List<CommunicationIndicator> getCommunicationIndicators() {
        return (List<CommunicationIndicator>) getRequest().getSession().getAttribute("communicationIndicators");
    }

    public void setCommunicationIndicators(List<CommunicationIndicator> communicationIndicators) {
        getRequest().getSession().setAttribute("communicationIndicators", communicationIndicators);
    }
    
    public void logout() {
        getRequest().getSession().invalidate();
    }
}
