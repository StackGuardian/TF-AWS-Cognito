variable "name" {
  type        = string
  description = "(Required) The name of the user pool."
}

variable "advanced_security_mode" {
  type        = string
  description = "(Optional) The mode for advanced security, must be one of `OFF`, `AUDIT` or `ENFORCED`. Additional pricing applies for Amazon Cognito advanced security features. For details see https://aws.amazon.com/cognito/pricing/"
  default     = "OFF"
}

variable "alias_attributes" {
  type        = set(string)
  description = "(Optional) Attributes supported as an alias for this user pool. Possible values: 'phone_number', 'email', or 'preferred_username'. Conflicts with username_attributes."
  default     = null
}

variable "username_attributes" {
  type        = set(string)
  description = "(Optional) Specifies whether email addresses or phone numbers can be specified as usernames when a user signs up. Conflicts with alias_attributes."
  default     = null
}

variable "allow_admin_create_user_only" {
  type        = bool
  description = "(Optional) Set to True if only the administrator is allowed to create user profiles. Set to False if users can sign themselves up via an app."
  default     = true
}

variable "enable_resource_seerver" {
    type = bool
    description = "Selector for deploying a resource server"
    default = false
  
}

variable "resource_servers" {
  description = "(Optional) A list of objects with resource server definitions."
  type        = any
  default = []
}

variable "clients" {
  description = "(Optional) A list of objects with the clients definitions."
  type        = any
  default = []
}

variable "domain" {
  description = "(Optional) Type a domain prefix to use for the sign-up and sign-in pages that are hosted by Amazon Cognito, e.g. 'https://{YOUR_PREFIX}.auth.eu-west-1.amazoncognito.com'. The prefix must be unique across the selected AWS Region. Domain names can only contain lower-case letters, numbers, and hyphens."
  type        = string
  default     = null
}

variable "certificate_arn" {
  description = "(Optional) The ARN of an ISSUED ACM certificate in us-east-1 for a custom domain."
  type        = string
  default     = null
}

variable "invite_email_subject" {
  type        = string
  description = "(Optional) The subject for email messages."
  default     = "Your new account."
}

variable "invite_email_message" {
  type        = string
  description = "(Optional) The message template for email messages. Must contain {username} and {####} placeholders, for username and temporary password, respectively."
  default     = "Your username is {username} and your temporary password is '{####}'."
}

variable "invite_sms_message" {
  type        = string
  description = "(Optional) The message template for SMS messages. Must contain {username} and {####} placeholders, for username and temporary password, respectively."
  default     = "Your username is {username} and your temporary password is '{####}'."
}

variable "auto_verified_attributes" {
  type        = set(string)
  description = "(Optional) The attributes to be auto-verified. Possible values: 'email', 'phone_number'."
  default = [
    "email"
  ]
}

variable "account_recovery_mechanisms" {
  type        = any
  description = "(Optional) A list of recovery_mechanisms which are defined by a `name` and its `priority`. Valid values for `name` are veri  fied_email, verified_phone_number, and admin_only."
  default = []
}


variable "challenge_required_on_new_device" {
  type        = bool
  description = "(Optional) Indicates whether a challenge is required on a new device. Only applicable to a new device."
  default     = true
}

variable "user_device_tracking" {
  type        = string
  description = "(Optional) Configure tracking of user devices. Set to 'OFF' to disable tracking, 'ALWAYS' to track all devices or 'USER_OPT_IN' to only track when user opts in."
  default     = "USER_OPT_IN"
}

variable "enable_username_case_sensitivity" {
  type        = bool
  description = "(Optional) Specifies whether username case sensitivity will be applied for all users in the user pool through Cognito APIs."
  default     = false
}

variable "email_sending_account" {
  type        = string
  description = "(Optional) The email delivery method to use. 'COGNITO_DEFAULT' for the default email functionality built into Cognito or 'DEVELOPER' to use your Amazon SES configuration."
  default     = "COGNITO_DEFAULT"
}

variable "email_reply_to_address" {
  type        = string
  description = "(Optional) - The REPLY-TO email address."
  default     = null
}

variable "email_source_arn" {
  type        = string
  description = "(Optional) - The ARN of the email source."
  default     = null
}

variable "email_from_address" {
  type        = string
  description = "(Optional) - Senders email address or senders name with their email address (e.g. 'john@smith.com' or 'John Smith <john@smith.com>')."
  default     = null
}

variable "mfa_configuration" {
  type        = string
  description = "Multi-Factor Authentication (MFA) configuration for the User Pool. Valid values: 'ON', 'OFF' or 'OPTIONAL'. 'ON' and 'OPTIONAL' require at least one of 'sms_configuration' or 'software_token_mfa_configuration' to be configured."
  default     = "OPTIONAL"
}

variable "password_minimum_length" {
  type        = number
  description = "(Optional) The minimum length of the password policy that you have set."
  default     = 20
}

variable "password_require_lowercase" {
  type        = bool
  description = "(Optional) Whether you have required users to use at least one lowercase letter in their password."
  default     = true
}

variable "password_require_numbers" {
  type        = bool
  description = "(Optional) Whether you have required users to use at least one number in their password."
  default     = true
}

variable "password_require_symbols" {
  type        = bool
  description = "(Optional) Whether you have required users to use at least one symbol in their password."
  default     = true
}

variable "password_require_uppercase" {
  type        = bool
  description = "(Optional) Whether you have required users to use at least one uppercase letter in their password."
  default     = true
}

variable "temporary_password_validity_days" {
  type        = number
  description = "(Optional) In the password policy you have set, refers to the number of days a temporary password is valid. If the user does not sign-in during this time, their password will need to be reset by an administrator."
  default     = 1
}

variable "allow_software_mfa_token" {
  description = "(Optional) Boolean whether to enable software token Multi-Factor (MFA) tokens, such as Time-based One-Time Password (TOTP). To disable software token MFA when 'sms_configuration' is not present, the 'mfa_configuration' argument must be set to OFF and the 'software_token_mfa_configuration' configuration block must be fully removed."
  type        = bool
  default     = true
}

variable "sms_authentication_message" {
  type        = string
  description = "(Optional) A string representing the SMS authentication message. The message must contain the {####} placeholder, which will be replaced with the authentication code."
  default     = "Your temporary password is {####}."
}

variable "lambda_create_auth_challenge" {
  type        = string
  description = "(Optional) The ARN of an AWS Lambda creating an authentication challenge."
  default     = null
}

variable "lambda_custom_message" {
  type        = string
  description = "(Optional) The ARN of a custom message AWS Lambda trigger."
  default     = null
}

variable "lambda_define_auth_challenge" {
  type        = string
  description = "(Optional) The ARN of an AWS Lambda that defines the authentication challenge."
  default     = null
}

variable "lambda_post_authentication" {
  type        = string
  description = "(Optional) The ARN of a post-authentication AWS Lambda trigger."
  default     = null
}

variable "lambda_post_confirmation" {
  type        = string
  description = "(Optional) The ARN of a post-confirmation AWS Lambda trigger."
  default     = null
}

variable "lambda_pre_authentication" {
  type        = string
  description = "(Optional) The ARN of a pre-authentication AWS Lambda trigger."
  default     = null
}

variable "lambda_pre_sign_up" {
  type        = string
  description = "(Optional) The ARN of a pre-registration AWS Lambda trigger."
  default     = null
}

variable "lambda_pre_token_generation" {
  type        = string
  description = "(Optional) The ARN of an AWS Lambda that allows customization of identity token claims before token generation."
  default     = null
}

variable "lambda_user_migration" {
  type        = string
  description = "(Optional) The ARN of the user migration AWS Lambda config type."
  default     = null
}

variable "lambda_verify_auth_challenge_response" {
  type        = string
  description = "(Optional) The ARN of an AWS Lambda that verifies the authentication challenge response."
  default     = null
}

variable "schema_attributes" {
  description = "(Optional) A list of schema attributes of a user pool. You can add a maximum of 25 custom attributes."
  type        = any
  default = []
}

variable "sms_configuration" {
  description = "(Optional) The `sms_configuration` with the `external_id` parameter used in iam role trust relationships and the `sns_caller_arn` parameter to set he arn of the amazon sns caller. this is usually the iam role that you've given cognito permission to assume."
  type = object({
    external_id = string
    sns_caller_arn = string
  })
  default = null
}

variable "default_email_option" {
  type        = string
  description = "(Optional) The default email option. Must be either `CONFIRM_WITH_CODE` or `CONFIRM_WITH_LINK`."
  default     = "CONFIRM_WITH_CODE"
}

variable "email_message" {
  type        = string
  description = "(Optional) The email message template. Must contain the {####} placeholder."
  default     = "Your verification code is {####}."
}

variable "email_message_by_link" {
  type        = string
  description = "(Optional) The email message template for sending a confirmation link to the user, it must contain the {##Any Text##} placeholder."
  default     = "Please click the link below to verify your email address. {##Verify Email##}."
}

variable "email_subject" {
  type        = string
  description = "(Optional) The subject line for the email message template."
  default     = "Your Verification Code"
}

variable "email_subject_by_link" {
  type        = string
  description = "(Optional) The subject line for the email message template for sending a confirmation link to the user."
  default     = "Your Verification Link"
}

variable "sms_message" {
  type        = string
  description = "(Optional) The SMS message template. Must contain the {####} placeholder, which will be replaced with the verification code. Can also contain the {username} placeholder which will be replaced with the username."
  default     = "Your verification code is {####}."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."

  #
  # Example:
  #
  # tags = {
  #   CreatedAt = "2020-02-07",
  #   Alice     = "Bob
  # }
  #

  default = {}
}

variable "module_depends_on" {
  type        = any
  description = "(Optional) A list of external resources the module depends_on."
  default     = []
}
variable "identity_providers" {
  description = "Cognito Pool Identity Providers"
  type        = list(any)
  default     = []
}
