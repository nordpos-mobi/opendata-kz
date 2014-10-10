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
package mobi.nordpos.opendata.model;

import java.math.BigInteger;

/**
 * @author Andrey Svininykh <svininykh@gmail.com>
 */
public class DemographicIndicator {

    private String id;
    private String adoption;
    private String birthrate;
    private String divorce;
    private String filiation;
    private String marriage;
    private String mortality;
    private String ChangeNameSurname;
    private String year;

    public DemographicIndicator() {
    }

    public DemographicIndicator(String id, String adoption, String birthrate, String divorce, String filiation,
            String marriage, String mortality, String ChangeNameSurname) {
        this.id = id;
        this.adoption = adoption;
        this.birthrate = birthrate;
        this.divorce = divorce;
        this.filiation = filiation;
        this.marriage = marriage;
        this.mortality = mortality;
        this.ChangeNameSurname = ChangeNameSurname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public BigInteger getAdoption() {
        return BigInteger.valueOf(Long.parseLong(adoption));
    }

    public void setAdoption(String adoption) {
        this.adoption = adoption;
    }

    public BigInteger getBirthrate() {
        return BigInteger.valueOf(Long.parseLong(birthrate));
    }

    public void setBirthrate(String birthrate) {
        this.birthrate = birthrate;
    }

    public BigInteger getDivorce() {
        return BigInteger.valueOf(Long.parseLong(divorce));
    }

    public void setDivorce(String divorce) {
        this.divorce = divorce;
    }

    public BigInteger getFiliation() {
        return BigInteger.valueOf(Long.parseLong(filiation));
    }

    public void setFiliation(String filiation) {
        this.filiation = filiation;
    }

    public BigInteger getMarriage() {
        return BigInteger.valueOf(Long.parseLong(marriage));
    }

    public void setMarriage(String marriage) {
        this.marriage = marriage;
    }

    public BigInteger getMortality() {
        return BigInteger.valueOf(Long.parseLong(mortality));
    }

    public void setMortality(String mortality) {
        this.mortality = mortality;
    }

    public BigInteger getChangeNameSurname() {
        return BigInteger.valueOf(Long.parseLong(ChangeNameSurname));
    }

    public void setChangeNameSurname(String ChangeNameSurname) {
        this.ChangeNameSurname = ChangeNameSurname;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

}
