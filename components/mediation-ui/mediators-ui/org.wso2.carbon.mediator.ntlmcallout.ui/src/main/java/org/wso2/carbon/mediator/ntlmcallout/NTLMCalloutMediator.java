/*
 *  Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 *  WSO2 Inc. licenses this file to you under the Apache License,
 *  Version 2.0 (the "License"); you may not use this file except
 *  in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */
package org.wso2.carbon.mediator.ntlmcallout;

import org.apache.axiom.om.OMAttribute;
import org.apache.axiom.om.OMElement;
import org.apache.synapse.config.xml.XMLConfigConstants;
import org.wso2.carbon.mediator.service.ui.AbstractMediator;

import javax.xml.namespace.QName;

public class NTLMCalloutMediator extends AbstractMediator{

    private static final QName TAG_NAME
            = new QName(XMLConfigConstants.SYNAPSE_NAMESPACE, "NTLM");
    private static final QName ATT_USER_NAME = new QName("username");
    private static final QName ATT_PASSWORD = new QName("password");
    private static final QName ATT_DOMAIN = new QName("domain");
    private static final QName ATT_HOST = new QName("host");
    private static final QName ATT_NTLM_VERSION = new QName("ntlmVersion");

    private String username;
    private String password;
    private String host;
    private String domain;
    private static String ntlmVersion;

    /** Only properties specified to the NTLM mediator */
    public static final String NTLM_V1 = "v1";
    public static final String NTLM_V2 = "v2";

    public OMElement serialize(OMElement parent) {

        OMElement ntlmMediator = fac.createOMElement("NTLM", synNS);
        saveTracingState(ntlmMediator, this);

        if (getUsername() != null) {
            ntlmMediator.addAttribute(fac.createOMAttribute("username", nullNS, getUsername()));
        }

        if (getPassword() != null) {
            ntlmMediator.addAttribute(fac.createOMAttribute("password", nullNS, getPassword()));
        }
        if (getHost() != null) {
            ntlmMediator.addAttribute(fac.createOMAttribute("host", nullNS, getHost()));
        }

        if (getDomain() != null) {
            ntlmMediator.addAttribute(fac.createOMAttribute("domain", nullNS, getDomain()));
        }

        if (getNtlmVersion() != null) {
            ntlmMediator.addAttribute(fac.createOMAttribute("ntlmVersion", nullNS, getNtlmVersion()));
        }

        if (parent != null) {
            parent.addChild(ntlmMediator);
        }

        return ntlmMediator;
    }

    public void build(OMElement elem) {

        OMAttribute attUserName = elem.getAttribute(ATT_USER_NAME);
        OMAttribute attPassword     = elem.getAttribute(ATT_PASSWORD);
        OMAttribute attHost = elem.getAttribute(ATT_HOST);
        OMAttribute attDomain = elem.getAttribute(ATT_DOMAIN);
        OMAttribute attVersion     = elem.getAttribute(ATT_NTLM_VERSION);

        if (attUserName != null) {
            setUsername(attUserName.getAttributeValue());
        }

        if (attPassword != null) {
            setPassword(attPassword.getAttributeValue());
        }

        if (attHost != null) {
            setHost(attHost.getAttributeValue());
        }

        if (attDomain != null) {
            setDomain(attDomain.getAttributeValue());
        }

        if (attVersion != null) {
            setNtlmVersion(attVersion.getAttributeValue());
        }

    }

    @Override
    public String getTagLocalName() {
        return "NTLM";
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public static String getNtlmVersion() {
        return ntlmVersion;
    }

    public static void setNtlmVersion(String ntlmVersion) {
        NTLMCalloutMediator.ntlmVersion = ntlmVersion;
    }
}
