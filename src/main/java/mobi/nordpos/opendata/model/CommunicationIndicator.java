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
public class CommunicationIndicator {

    public enum CommunicationIndicatorType {

        FIX_PHONE_SUBSCRIBER, FIX_INET_SUBSCRIBER, MOBILE_PHONE_SUBSCRIBER, MOBILE_HI_INET_SUBSCRIBER, MOBILE_LOW_INET_SUBSCRIBER
    };

    private int month;
    private int year;
    private BigInteger value;
    private CommunicationIndicatorType type;

    public CommunicationIndicator(){        
    }
    
    public CommunicationIndicator(int month, int year, BigInteger value, CommunicationIndicatorType type) {
        this.month = month;
        this.year = year;
        this.value = value;
        this.type = type;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public BigInteger getValue() {        
        return value;
    }

    public void setValue(BigInteger value) {
        this.value = value;
    }

    public CommunicationIndicatorType getType() {
        return type;
    }

    public void setType(CommunicationIndicatorType type) {
        this.type = type;
    }

}
