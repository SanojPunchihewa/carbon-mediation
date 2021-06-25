/*
 *  Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

function displaySetProperties(isDisply) {
    var toDisplayElement;
    displayElement("mediator.property.action_row", isDisply);
    displayElement("mediator.property.value_row", isDisply);
    toDisplayElement = document.getElementById("mediator.namespace.editor");
    if (toDisplayElement != null) {
        if (isDisply) {
            toDisplayElement.style.display = '';
        } else {
            toDisplayElement.style.display = 'none';
        }
    }
}

function displayElement(elementId, isDisplay) {
    var toDisplayElement = document.getElementById(elementId);
    if (toDisplayElement != null) {
        if (isDisplay) {
            toDisplayElement.style.display = '';
        } else {
            toDisplayElement.style.display = 'none';
        }
    }
}

function NTLMMediatorValidate() {

    var username = document.getElementById("mediator.ntlm.username");
    if (username && username.value == "") {
        CARBON.showErrorDialog(ntlmcalloutMediatorJsi18n["ntlm.username.required"]);
        return false;
    }

    var password = document.getElementById("mediator.ntlm.password");
    if (password && password.value == "") {
        CARBON.showErrorDialog(ntlmcalloutMediatorJsi18n["ntlm.password.required"]);
        return false;
    }

    var host = document.getElementById("mediator.ntlm.host");
    if (host && host.value == "") {
        CARBON.showErrorDialog(ntlmcalloutMediatorJsi18n["ntlm.host.required"]);
        return false;
    }

    var domain = document.getElementById("mediator.ntlm.domain");
    if (domain && domain.value == "") {
        CARBON.showErrorDialog(ntlmcalloutMediatorJsi18n["ntlm.domain.required"]);
        return false;
    }

    return true;
}

function createNamespaceEditor(elementId, id, prefix, uri) {
    var ele = document.getElementById(elementId);
    if (ele != null) {
        var createEle = document.getElementById(id);
        if (createEle != null) {
            if (createEle.style.display == 'none') {
                createEle.style.display = '';
            } else {
                createEle.style.display = 'none';
            }
        } else {
            ele.innerHTML = '<div id=\"' + id + '\">' +
                            '<table><tbody><tr><td>Prefix</td><td><input width="80" type="text" id=\"'+ prefix + '\"+ ' +
                            'name=\"'+ prefix + '\" value=""/></td></tr><tr><td>URI</td><td><input width="80" ' +
                            'type="text" id=\"'+ uri + '\"+ name=\"'+ uri + '\"+ value=""/></td></tr></tbody></table></div>';
        }
    }
}

function showHideWSSecRows() {
    if (document.getElementById('wsSecurity').checked == true) {
        document.getElementById('tr_ws_sec_policy_key').style.display = '';
        document.getElementById('tr_ws_use_different_policies').style.display = '';

        if (document.getElementById('wsSecurityUseDifferentPolicies').checked == true) {
            document.getElementById('tr_ws_sec_policy_key').style.display = "none";
            document.getElementById('tr_ws_sec_inbound_policy_key').style.display = '';
            document.getElementById('tr_ws_sec_outbound_policy_key').style.display = '';
        }
    } else {
        document.getElementById('tr_ws_sec_policy_key').style.display = "none";
        document.getElementById('tr_ws_use_different_policies').style.display = "none";
        document.getElementById('tr_ws_sec_outbound_policy_key').style.display = "none";
        document.getElementById('tr_ws_sec_inbound_policy_key').style.display = "none";
    }
}

function showHideInOutWSSecRows() {
    if (document.getElementById('wsSecurityUseDifferentPolicies').checked == true) {
        document.getElementById('tr_ws_sec_policy_key').style.display = "none";
        document.getElementById('tr_ws_sec_inbound_policy_key').style.display = '';
        document.getElementById('tr_ws_sec_outbound_policy_key').style.display = '';
    } else {
        document.getElementById('tr_ws_sec_policy_key').style.display = '';
        document.getElementById('tr_ws_sec_outbound_policy_key').style.display = "none";
        document.getElementById('tr_ws_sec_inbound_policy_key').style.display = "none";
    }
}