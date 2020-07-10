

-- Settings Table

-- Removes "Powered by nopCommerce" link
update [dbo].[Setting] set value = '' where Name = 'adminareasettings.lastnewstitleadminarea'

-- Store Facebook
update [dbo].[Setting] set value = 'https://www.facebook.com/UniglobeInt' where Name = 'storeinformationsettings.facebooklink'

-- Store Facebook
update [dbo].[Setting] set value = 'https://twitter.com/UniglobeInt' where Name = 'storeinformationsettings.twitterlink'

-- Store Facebook
update [dbo].[Setting] set value = 'https://www.youtube.com/UniglobeInt' where Name = 'storeinformationsettings.youtubelink'



-- LocaleStringResource Table
-- Set name
update [dbo].[LocaleStringResource] set ResourceValue = 'Name' where ResourceName = 'contactus.fullname'
update [dbo].[LocaleStringResource] set ResourceValue = 'Enter your name.' where ResourceName = 'ContactUs.FullName.Hint'
update [dbo].[LocaleStringResource] set ResourceValue = 'Enter name' where ResourceName = 'ContactUs.FullName.Required'

-- Set email
update [dbo].[LocaleStringResource] set ResourceValue = 'Email' where ResourceName = 'contactus.email'
update [dbo].[LocaleStringResource] set ResourceValue = 'Enter your email address.' where ResourceName = 'ContactUs.Email.Hint'
update [dbo].[LocaleStringResource] set ResourceValue = 'Enter email' where ResourceName = 'ContactUs.Email.Required'

-- Set phone
IF EXISTS (SELECT * FROM [dbo].[LocaleStringResource] WHERE ResourceName = 'contactus.phone')
BEGIN
update [dbo].[LocaleStringResource] set ResourceValue = 'Phone' where ResourceName = 'contactus.phone'
END
ELSE
BEGIN
Insert into [dbo].[LocaleStringResource] (ResourceName, ResourceValue) values ('contactus.phone', 'Phone')
END

IF EXISTS (SELECT * FROM [dbo].[LocaleStringResource] WHERE ResourceName = 'ContactUs.Phone.hint')
BEGIN
update [dbo].[LocaleStringResource] set ResourceValue = 'Enter your phone.' where ResourceName = 'ContactUs.Phone.hint'
END
ELSE
BEGIN
Insert into [dbo].[LocaleStringResource] (ResourceName, ResourceValue, LanguageId) values ('ContactUs.Phone.hint', 'Enter your phone.', 1)
END

IF EXISTS (SELECT * FROM [dbo].[LocaleStringResource] WHERE ResourceName = 'ContactUs.Phone.Required')
BEGIN
update [dbo].[LocaleStringResource] set ResourceValue = 'Enter phone.' where ResourceName = 'ContactUs.Phone.Required'
END
ELSE
BEGIN
Insert into [dbo].[LocaleStringResource] (ResourceName, ResourceValue, LanguageId) values ('ContactUs.Phone.Required', 'Enter phone.', 1)
END

-- Set message
update [dbo].[LocaleStringResource] set ResourceValue = 'Message' where ResourceName = 'contactus.enquiry'
update [dbo].[LocaleStringResource] set ResourceValue = 'Enter your message.' where ResourceName = 'ContactUs.enquiry.Hint'
update [dbo].[LocaleStringResource] set ResourceValue = 'Enter message' where ResourceName = 'ContactUs.enquiry.Required'

-- Set phone
IF EXISTS (SELECT * FROM [dbo].[LocaleStringResource] WHERE ResourceName = 'ContactUs.Subscribe')
BEGIN
update [dbo].[LocaleStringResource] set ResourceValue = 'Subscribe for our latest products and services' where ResourceName = 'ContactUs.Subscribe'
END
ELSE
BEGIN
Insert into [dbo].[LocaleStringResource] (ResourceName, ResourceValue, LanguageId) values ('ContactUs.Subscribe', 'Subscribe for our latest products and services', 1)
END

-- Set services
IF EXISTS (SELECT * FROM [dbo].[LocaleStringResource] WHERE ResourceName = 'services')
BEGIN
update [dbo].[LocaleStringResource] set ResourceValue = 'Services' where ResourceName = 'services'
END
ELSE
BEGIN
Insert into [dbo].[LocaleStringResource] (ResourceName, ResourceValue, LanguageId) values ('services', 'Services', 1)
END

-- Set about us
IF EXISTS (SELECT * FROM [dbo].[LocaleStringResource] WHERE ResourceName = 'aboutus')
BEGIN
update [dbo].[LocaleStringResource] set ResourceValue = 'About us' where ResourceName = 'aboutus'
END
ELSE
BEGIN
Insert into [dbo].[LocaleStringResource] (ResourceName, ResourceValue, LanguageId) values ('aboutus', 'About us', 1)
END