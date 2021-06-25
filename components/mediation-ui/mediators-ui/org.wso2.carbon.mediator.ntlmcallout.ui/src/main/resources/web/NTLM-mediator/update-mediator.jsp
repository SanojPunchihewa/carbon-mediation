<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<%@ page import="org.apache.synapse.util.xpath.SynapseXPath" %>
<%@ page import="org.wso2.carbon.mediator.service.ui.Mediator" %>
<%@ page import="org.wso2.carbon.sequences.ui.util.SequenceEditorHelper" %>
<%@ page import="org.wso2.carbon.sequences.ui.util.ns.XPathFactory" %>

<%
    Mediator mediator = SequenceEditorHelper.getEditingMediator(request, session);
    String username = "", password = "", host = "", domain = "", ntlmVersion = "";
    String param = null;

    if (!(mediator instanceof NTLMCalloutMediator)) {
       throw new RuntimeException("Unable to edit the mediator");
    }
    NTLMCalloutMediator ntlmMediator = (NTLMCalloutMediator) mediator;

    param = request.getParameter("mediator.ntlm.username");
    if (param != null && !param.equals("")) {
        ntlmMediator.setUsername(param);
    }
    param = request.getParameter("mediator.ntlm.password");
    if (param != null && !param.equals("")) {
        ntlmMediator.setPassword(param);
    }
    param = request.getParameter("mediator.ntlm.host");
    if (param != null && !param.equals("")) {
        ntlmMediator.setHost(param);
    }
    param = request.getParameter("mediator.ntlm.domain");
    if (param != null && !param.equals("")) {
        ntlmMediator.setDomain(param);
    }
    param = request.getParameter("mediator.ntlm.version");
    if (param != null && !param.equals("")) {
        ntlmMediator.setNtlmVersion(param);
    }

%>

