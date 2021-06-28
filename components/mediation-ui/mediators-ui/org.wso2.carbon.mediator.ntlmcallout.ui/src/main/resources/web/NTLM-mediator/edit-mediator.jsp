<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%--
  ~  Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
  ~
  ~  Licensed under the Apache License, Version 2.0 (the "License");
  ~  you may not use this file except in compliance with the License.
  ~  You may obtain a copy of the License at
  ~
  ~        http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~  Unless required by applicable law or agreed to in writing, software
  ~  distributed under the License is distributed on an "AS IS" BASIS,
  ~  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~  See the License for the specific language governing permissions and
  ~  limitations under the License.
  --%>

<%@ page import="org.wso2.carbon.mediator.ntlmcallout.NTLMCalloutMediator" %>
<%@ page import="org.wso2.carbon.mediator.service.ui.Mediator" %>
<%@ page import="org.wso2.carbon.sequences.ui.util.SequenceEditorHelper" %>
<%@ page import="org.wso2.carbon.sequences.ui.util.ns.NameSpacesRegistrar" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://wso2.org/projects/carbon/taglibs/carbontags.jar" prefix="carbon" %>

<jsp:include page="../resources/resources-i18n-ajaxprocessor.jsp"/>

<%
    Mediator mediator = SequenceEditorHelper.getEditingMediator(request, session);
    String username = "", password = "", host = "", domain = "", ntlmVersion = "";

    if (!(mediator instanceof NTLMCalloutMediator)) {
        // todo : proper error handling
        throw new RuntimeException("Unable to edit the mediator");
    }
    NTLMCalloutMediator ntlmMediator = (NTLMCalloutMediator) mediator;
        if (ntlmMediator.getUsername() != null) {
            username = ntlmMediator.getUsername();
        }
        if (ntlmMediator.getPassword() != null) {
            password = ntlmMediator.getPassword();
        }
        if (ntlmMediator.getHost() != null) {
            host = ntlmMediator.getHost();
        }
        if (ntlmMediator.getDomain() != null) {
            domain = ntlmMediator.getDomain();
        }
        if (ntlmMediator.getNtlmVersion() != null) {
            ntlmVersion = ntlmMediator.getNtlmVersion();
        }
%>

<fmt:bundle basename="org.wso2.carbon.mediator.ntlmcallout.ui.i18n.Resources">
<carbon:jsi18n
        resourceBundle="org.wso2.carbon.mediator.ntlmcallout.ui.i18n.JSResources"
        request="<%=request%>" i18nObjectName="ntlmcalloutMediatorJsi18n"/>
<div>
    <script type="text/javascript" src="../NTLM-mediator/js/mediator-util.js"></script>
    <script type="text/javascript" src="../resources/js/resource_util.js"></script>
    <table class="normal" width="100%">
    <tr>
        <td>
            <h2><fmt:message key="mediator.ntlm.header"/></h2>
        </td>
    </tr>
    <tr>
    <td>
    <h3 class="mediator"><fmt:message key="mediator.ntlm.serviceurl"/></h3>
    <table border="0" class="normal" >
            <tr>
                <td>
                    <fmt:message key="mediator.ntlm.username"/>
                </td>
                <td>
                    <input type="text" size="40" id="mediator.ntlm.username" name="mediator.ntlm.username" value="<%=username%>" style="width:300px"/>
                </td>
            </tr>
            <tr>
                <td>
                    <fmt:message key="mediator.ntlm.password"/>
                </td>
                <td>
                    <input type="password" size="40" id="mediator.ntlm.password" name="mediator.ntlm.password" value="<%=password%>" style="width:300px"/>
                </td>
            </tr>
            <tr>
                <td>
                    <fmt:message key="mediator.ntlm.domain"/>
                </td>
                <td>
                    <input type="text" size="40" id="mediator.ntlm.domain" name="mediator.ntlm.domain" value="<%=domain%>" style="width:300px"/>
                </td>
            </tr>
            <tr>
                <td>
                    <fmt:message key="mediator.ntlm.host"/>
                </td>
                <td>
                    <input type="text" size="40" id="mediator.ntlm.host" name="mediator.ntlm.host" value="<%=host%>" style="width:300px"/>
                </td>
            </tr>
            <tr>
                <td>
                    <fmt:message key="mediator.ntlm.version"/>
                </td>
                <td>
                    <select align='left' id="mediator.ntlm.version" name="mediator.ntlm.version">
                        <%
                            if (ntlmVersion.equals(ntlmMediator.NTLM_V1)) {
                        %>
                        <option value="<%=ntlmMediator.NTLM_V1%>" selected="true"><fmt:message key="mediator.ntlm.version.v1"/></option>
                        <option value="<%=ntlmMediator.NTLM_V2%>"><fmt:message key="mediator.ntlm.version.v2"/></option>
                        <%
                        } else if (ntlmVersion.equals(ntlmMediator.NTLM_V2)) {
                        %>
                        <option value="<%=ntlmMediator.NTLM_V1%>"><fmt:message key="mediator.ntlm.version.v1"/></option>
                        <option value="<%=ntlmMediator.NTLM_V2%>" selected="true"><fmt:message key="mediator.ntlm.version.v2"/></option>
                        <%
                        } else {
                        %>
                        <option value="<%=ntlmMediator.NTLM_V1%>" selected="true"><fmt:message key="mediator.ntlm.version.v1"/></option>
                        <option value="<%=ntlmMediator.NTLM_V2%>"><fmt:message key="mediator.ntlm.version.v2"/></option>
                        <% } %>
                    </select>
                </td>
            </tr>
    </table>
    </td>
    </tr>
    </table>
</div>
</fmt:bundle>