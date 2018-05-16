drop table REG_CLUSTER_LOCK cascade constraints;
drop table REG_LOG cascade constraints;
drop table REG_PATH cascade constraints;
drop table REG_CONTENT cascade constraints;
drop table REG_CONTENT_HISTORY cascade constraints;
drop table REG_RESOURCE cascade constraints;
drop table REG_RESOURCE_HISTORY cascade constraints;
drop table REG_COMMENT cascade constraints;
drop table REG_RESOURCE_COMMENT cascade constraints;
drop table REG_RATING cascade constraints;
drop table REG_RESOURCE_RATING cascade constraints;
drop table REG_TAG cascade constraints;
drop table REG_RESOURCE_TAG cascade constraints;
drop table REG_PROPERTY cascade constraints;
drop table REG_RESOURCE_PROPERTY cascade constraints;
drop table REG_ASSOCIATION cascade constraints;
drop table REG_SNAPSHOT cascade constraints;
drop table UM_TENANT cascade constraints;
drop table UM_DOMAIN cascade constraints;
drop table UM_USER cascade constraints;
drop table UM_SYSTEM_USER cascade constraints;
drop table UM_USER_ATTRIBUTE cascade constraints;
drop table UM_ROLE cascade constraints;
drop table UM_MODULE cascade constraints;
drop table UM_MODULE_ACTIONS cascade constraints;
drop table IDP_CLAIM_MAPPING cascade constraints;
drop table IDP_AUTHENTICATOR cascade constraints;
drop table IDP_METADATA cascade constraints;
drop table IDP_AUTHENTICATOR_PROPERTY cascade constraints;
drop table IDP_PROVISIONING_CONFIG cascade constraints;
drop table IDP_PROV_CONFIG_PROPERTY cascade constraints;
drop table IDP_PROVISIONING_ENTITY cascade constraints;
drop table IDP_LOCAL_CLAIM cascade constraints;
drop table IDN_ASSOCIATED_ID cascade constraints;
drop table IDN_USER_ACCOUNT_ASSOCIATION cascade constraints;
drop table FIDO_DEVICE_STORE cascade constraints;
drop table WF_REQUEST cascade constraints;
drop table WF_BPS_PROFILE cascade constraints;
drop table WF_WORKFLOW cascade constraints;
drop table WF_WORKFLOW_ASSOCIATION cascade constraints;
drop table WF_WORKFLOW_CONFIG_PARAM cascade constraints;
drop table WF_REQUEST_ENTITY_RELATIONSHIP cascade constraints;
drop table WF_WORKFLOW_REQUEST_RELATION cascade constraints;
drop table IDN_RECOVERY_DATA cascade constraints;
drop table IDN_PASSWORD_HISTORY_DATA cascade constraints;
drop table IDN_CLAIM_DIALECT cascade constraints;
drop table IDN_CLAIM cascade constraints;
drop table IDN_CLAIM_MAPPED_ATTRIBUTE cascade constraints;
drop table IDN_CLAIM_PROPERTY cascade constraints;
drop table IDN_CLAIM_MAPPING cascade constraints;
drop table IDN_SAML2_ASSERTION_STORE cascade constraints;
drop table IDN_OIDC_JTI cascade constraints;
drop table IDN_OIDC_PROPERTY cascade constraints;
drop table IDN_OIDC_REQ_OBJECT_REFERENCE cascade constraints;
drop table IDN_OIDC_REQ_OBJECT_CLAIMS cascade constraints;
drop table IDN_OIDC_REQ_OBJ_CLAIM_VALUES cascade constraints;
drop table IDN_CERTIFICATE cascade constraints;
drop table CM_PII_CATEGORY cascade constraints;
drop table CM_RECEIPT cascade constraints;
drop table CM_PURPOSE cascade constraints;
drop table CM_PURPOSE_CATEGORY cascade constraints;
drop table CM_RECEIPT_SP_ASSOC cascade constraints;
drop table CM_SP_PURPOSE_ASSOC cascade constraints;
drop table CM_SP_PURPOSE_PURPOSE_CAT_ASSC cascade constraints;
drop table CM_PURPOSE_PII_CAT_ASSOC cascade constraints;
drop table CM_SP_PURPOSE_PII_CAT_ASSOC cascade constraints;
drop table CM_CONSENT_RECEIPT_PROPERTY cascade constraints;
drop table AM_SUBSCRIBER cascade constraints;
drop table AM_APPLICATION cascade constraints;
drop table AM_API cascade constraints;
drop table AM_API_URL_MAPPING cascade constraints;
drop table AM_SUBSCRIPTION cascade constraints;
drop table AM_SUBSCRIPTION_KEY_MAPPING cascade constraints;
drop table AM_APPLICATION_KEY_MAPPING cascade constraints;
drop table AM_APPLICATION_REGISTRATION cascade constraints;
drop table AM_API_LC_EVENT cascade constraints;
drop table AM_APP_KEY_DOMAIN_MAPPING cascade constraints;
drop table AM_API_COMMENTS cascade constraints;
drop table AM_API_RATINGS cascade constraints;
drop table AM_TIER_PERMISSIONS cascade constraints;
drop table AM_EXTERNAL_STORES cascade constraints;
drop table AM_WORKFLOWS cascade constraints;
drop table AM_API_SCOPES cascade constraints;
drop table AM_API_DEFAULT_VERSION cascade constraints;
drop table AM_ALERT_TYPES cascade constraints;
drop table AM_ALERT_TYPES_VALUES cascade constraints;
drop table AM_ALERT_EMAILLIST cascade constraints;
drop table AM_ALERT_EMAILLIST_DETAILS cascade constraints;
drop table AM_POLICY_SUBSCRIPTION cascade constraints;
drop table AM_POLICY_APPLICATION cascade constraints;
drop table AM_API_THROTTLE_POLICY cascade constraints;
drop table AM_CONDITION_GROUP cascade constraints;
drop table AM_QUERY_PARAMETER_CONDITION cascade constraints;
drop table AM_HEADER_FIELD_CONDITION cascade constraints;
drop table AM_JWT_CLAIM_CONDITION cascade constraints;
drop table AM_IP_CONDITION cascade constraints;
drop table AM_POLICY_GLOBAL cascade constraints;
drop table AM_THROTTLE_TIER_PERMISSIONS cascade constraints;
drop table AM_BLOCK_CONDITIONS cascade constraints;
drop table AM_CERTIFICATE_METADATA cascade constraints;
drop table AM_APPLICATION_GROUP_MAPPING cascade constraints;
drop table AM_USAGE_UPLOADED_FILES cascade constraints;
drop table AM_API_LC_PUBLISH_EVENTS cascade constraints;
drop table MB_QUEUE_MAPPING cascade constraints;
drop table MB_METADATA cascade constraints;
drop table MB_CONTENT cascade constraints;
drop table MB_EXPIRATION_DATA cascade constraints;
drop table MB_RETAINED_METADATA cascade constraints;
drop table MB_DURABLE_SUBSCRIPTION cascade constraints;
drop table MB_NODE cascade constraints;
drop table MB_EXCHANGE cascade constraints;
drop table MB_QUEUE cascade constraints;
drop table MB_BINDING cascade constraints;
drop table MB_QUEUE_COUNTER cascade constraints;
drop table MB_SLOT cascade constraints;
drop table MB_SLOT_MESSAGE_ID cascade constraints;
drop table MB_NODE_TO_LAST_PUBLISHED_ID cascade constraints;
drop table MB_QUEUE_TO_LAST_ASSIGNED_ID cascade constraints;
drop table MB_RETAINED_CONTENT cascade constraints;
drop table MB_MSG_STORE_STATUS cascade constraints;
drop table UM_PERMISSION cascade constraints;
drop table UM_ROLE_PERMISSION cascade constraints;
drop table UM_USER_PERMISSION cascade constraints;
drop table UM_USER_ROLE cascade constraints;
drop table UM_SHARED_USER_ROLE cascade constraints;
drop table UM_ACCOUNT_MAPPING cascade constraints;
drop table UM_DIALECT cascade constraints;
drop table UM_CLAIM cascade constraints;
drop table UM_PROFILE_CONFIG cascade constraints;
drop table UM_CLAIM_BEHAVIOR cascade constraints;
drop table UM_HYBRID_ROLE cascade constraints;
drop table UM_HYBRID_USER_ROLE cascade constraints;
drop table UM_HYBRID_REMEMBER_ME cascade constraints;
drop table UM_SYSTEM_ROLE cascade constraints;
drop table UM_SYSTEM_USER_ROLE cascade constraints;
drop table METRIC_GAUGE cascade constraints;
drop table METRIC_COUNTER cascade constraints;
drop table METRIC_METER cascade constraints;
drop table METRIC_HISTOGRAM cascade constraints;
drop table METRIC_TIMER cascade constraints;
drop table IDN_BASE_TABLE cascade constraints;
drop table IDN_OAUTH_CONSUMER_APPS cascade constraints;
drop table IDN_OAUTH2_SCOPE_VALIDATORS cascade constraints;
drop table IDN_OAUTH1A_REQUEST_TOKEN cascade constraints;
drop table IDN_OAUTH1A_ACCESS_TOKEN cascade constraints;
drop table IDN_OAUTH2_ACCESS_TOKEN cascade constraints;
drop table IDN_OAUTH2_AUTHORIZATION_CODE cascade constraints;
drop table IDN_OAUTH2_ACCESS_TOKEN_SCOPE cascade constraints;
drop table IDN_OAUTH2_SCOPE cascade constraints;
drop table IDN_OAUTH2_SCOPE_BINDING cascade constraints;
drop table IDN_OAUTH2_RESOURCE_SCOPE cascade constraints;
drop table IDN_SCIM_GROUP cascade constraints;
drop table IDN_OPENID_REMEMBER_ME cascade constraints;
drop table IDN_OPENID_USER_RPS cascade constraints;
drop table IDN_OPENID_ASSOCIATIONS cascade constraints;
drop table IDN_STS_STORE cascade constraints;
drop table IDN_IDENTITY_USER_DATA cascade constraints;
drop table IDN_IDENTITY_META_DATA cascade constraints;
drop table IDN_THRIFT_SESSION cascade constraints;
drop table IDN_AUTH_SESSION_STORE cascade constraints;
drop table SP_APP cascade constraints;
drop table SP_METADATA cascade constraints;
drop table SP_INBOUND_AUTH cascade constraints;
drop table SP_AUTH_STEP cascade constraints;
drop table SP_FEDERATED_IDP cascade constraints;
drop table SP_CLAIM_MAPPING cascade constraints;
drop table SP_ROLE_MAPPING cascade constraints;
drop table SP_REQ_PATH_AUTHENTICATOR cascade constraints;
drop table SP_PROVISIONING_CONNECTOR cascade constraints;
drop table SP_AUTH_SCRIPT cascade constraints;
drop table IDP cascade constraints;
drop table IDP_ROLE cascade constraints;
drop table IDP_ROLE_MAPPING cascade constraints;
drop table IDP_CLAIM cascade constraints;

drop sequence AM_ALERT_EMAILLIST_SEQ;
drop sequence AM_ALERT_TYPES_SEQ;
drop sequence AM_API_COMMENTS_SEQUENCE;
drop sequence AM_API_DEFAULT_VERSION_SEQ;
drop sequence AM_API_LC_EVENT_SEQUENCE;
drop sequence AM_API_LC_PUBLISH_EVENTS_SEQ;
drop sequence AM_API_RATINGS_SEQUENCE;
drop sequence AM_API_SEQUENCE;
drop sequence AM_API_THROTTLE_POLICY_SEQ;
drop sequence AM_API_URL_MAPPING_SEQUENCE;
drop sequence AM_APPLICATION_SEQUENCE;
drop sequence AM_APP_REGISTRATION_SEQUENCE;
drop sequence AM_BLOCK_CONDITIONS_SEQ;
drop sequence AM_CONDITION_GROUP_SEQ;
drop sequence AM_EXTERNAL_STORES_SEQUENCE;
drop sequence AM_HEADER_FIELD_CONDITION_SEQ;
drop sequence AM_IP_CONDITION_SEQ;
drop sequence AM_JWT_CLAIM_CONDITION_SEQ;
drop sequence AM_POLICY_APPLICATION_SEQ;
drop sequence AM_POLICY_GLOBAL_SEQ;
drop sequence AM_POLICY_SUBSCRIPTION_SEQ;
drop sequence AM_SUBSCRIBER_SEQUENCE;
drop sequence AM_SUBSCRIPTION_SEQUENCE;
drop sequence AM_TIER_PERMISSIONS_SEQUENCE;
drop sequence AM_WORKFLOWS_SEQUENCE;
drop sequence CM_PII_CATEGORY_SEQ;
drop sequence CM_PURPOSE_CATEGORY_SEQ;
drop sequence CM_PURPOSE_SEQ;
drop sequence CM_RECEIPT_SP_ASSOC_SEQ;
drop sequence CM_SP_PURPOSE_ASSOC_SEQ;
drop sequence IDN_ASSOCIATED_ID_SEQ;
drop sequence IDN_CERTIFICATE_SEQUENCE;
drop sequence IDN_CLAIM_DIALECT_SEQ;
drop sequence IDN_CLAIM_MAPPED_ATTRIBUTE_SEQ;
drop sequence IDN_CLAIM_MAPPING_SEQ;
drop sequence IDN_CLAIM_PROPERTY_SEQ;
drop sequence IDN_CLAIM_SEQ;
drop sequence IDN_OAUTH2_SCOPE_SEQUENCE;
drop sequence IDN_OAUTH_CONSUMER_APPS_SEQ;
drop sequence IDN_OIDC_PROPERTY_SEQ;
drop sequence IDN_OIDC_REQ_OBJECT_REF_SEQ;
drop sequence IDN_OIDC_REQ_OBJ_CLAIMS_SEQ;
drop sequence IDN_OIDC_REQ_OBJ_CLM_VAL_SEQ;
drop sequence IDN_PASSWORD_HISTORY_DATA_SEQ;
drop sequence IDN_SAML2_ASSERTION_STORE_SEQ;
drop sequence IDN_SCIM_GROUP_SEQUENCE;
drop sequence IDN_STS_STORE_SEQUENCE;
drop sequence IDP_AUTHENTICATOR_PROP_SEQ;
drop sequence IDP_AUTHENTICATOR_SEQ;
drop sequence IDP_CLAIM_MAPPING_SEQ;
drop sequence IDP_CLAIM_SEQ;
drop sequence IDP_LOCAL_CLAIM_SEQ;
drop sequence IDP_METADATA_SEQ;
drop sequence IDP_PROVISIONING_CONFIG_SEQ;
drop sequence IDP_PROV_CONFIG_PROP_SEQ;
drop sequence IDP_PROV_ENTITY_SEQ;
drop sequence IDP_ROLE_MAPPING_SEQ;
drop sequence IDP_ROLE_SEQ;
drop sequence IDP_SEQ;
drop sequence MB_QUEUE_MAPPING_SEQUENCE;
drop sequence MB_SLOT_ID_SEQUENCE;
drop sequence METRIC_COUNTER_SEQUENCE;
drop sequence METRIC_GAUGE_SEQUENCE;
drop sequence METRIC_HISTOGRAM_SEQUENCE;
drop sequence METRIC_METER_SEQUENCE;
drop sequence METRIC_TIMER_SEQUENCE;
drop sequence QUERY_PARAMETER_CONDITION_SEQ;
drop sequence REG_ASSOCIATION_SEQUENCE;
drop sequence REG_COMMENT_SEQUENCE;
drop sequence REG_CONTENT_SEQUENCE;
drop sequence REG_LOG_SEQUENCE;
drop sequence REG_PATH_SEQUENCE;
drop sequence REG_PROPERTY_SEQUENCE;
drop sequence REG_RATING_SEQUENCE;
drop sequence REG_RESOURCE_SEQUENCE;
drop sequence REG_SNAPSHOT_SEQUENCE;
drop sequence REG_TAG_SEQUENCE;
drop sequence SP_APP_SEQ;
drop sequence SP_AUTH_SCRIPT_SEQ;
drop sequence SP_AUTH_STEP_SEQ;
drop sequence SP_CLAIM_MAPPING_SEQ;
drop sequence SP_INBOUND_AUTH_SEQ;
drop sequence SP_METADATA_SEQ;
drop sequence SP_PROV_CONNECTOR_SEQ;
drop sequence SP_REQ_PATH_AUTH_SEQ;
drop sequence SP_ROLE_MAPPING_SEQ;
drop sequence THROTTLE_TIER_PERMISSIONS_SEQ;
drop sequence UM_ACCOUNT_MAPPING_SEQUENCE;
drop sequence UM_CLAIM_BEHAVIOR_SEQUENCE;
drop sequence UM_CLAIM_SEQUENCE;
drop sequence UM_DIALECT_SEQUENCE;
drop sequence UM_DOMAIN_SEQUENCE;
drop sequence UM_HYBRID_REMEMBER_ME_SEQUENCE;
drop sequence UM_HYBRID_ROLE_SEQUENCE;
drop sequence UM_HYBRID_USER_ROLE_SEQUENCE;
drop sequence UM_MODULE_SEQUENCE;
drop sequence UM_PERMISSION_SEQUENCE;
drop sequence UM_PROFILE_CONFIG_SEQUENCE;
drop sequence UM_ROLE_PERMISSION_SEQUENCE;
drop sequence UM_ROLE_SEQUENCE;
drop sequence UM_SYSTEM_ROLE_SEQUENCE;
drop sequence UM_SYSTEM_USER_ROLE_SEQUENCE;
drop sequence UM_SYSTEM_USER_SEQUENCE;
drop sequence UM_TENANT_SEQUENCE;
drop sequence UM_USER_ATTRIBUTE_SEQUENCE;
drop sequence UM_USER_PERMISSION_SEQUENCE;
drop sequence UM_USER_ROLE_SEQUENCE;
drop sequence UM_USER_SEQUENCE;
drop sequence WF_WORKFLOW_ASSOCIATION_SEQ;