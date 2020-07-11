

-- Settings Table

-- Removes "Powered by nopCommerce" link
update [dbo].[Setting] set value = 'True' where Name = 'storeinformationsettings.hidepoweredbynopcommerce'

-- Last news title ??
update [dbo].[Setting] set value = '' where Name = 'adminareasettings.lastnewstitleadminarea'

-- Store Facebook
update [dbo].[Setting] set value = 'https://www.facebook.com/UniglobeInt' where Name = 'storeinformationsettings.facebooklink'

-- Store Facebook
update [dbo].[Setting] set value = 'https://twitter.com/UniglobeInt' where Name = 'storeinformationsettings.twitterlink'

-- Store Facebook
update [dbo].[Setting] set value = 'https://www.youtube.com/UniglobeInt' where Name = 'storeinformationsettings.youtubelink'



-- LocaleStringResource Table
-- Set name
update [dbo].[LocaleStringResource] set value = 'Name' where Name = 'contactus.fullname'
update [dbo].[LocaleStringResource] set value = 'Enter your name.' where Name = 'ContactUs.FullName.Hint'
update [dbo].[LocaleStringResource] set value = 'Enter name' where Name = 'ContactUs.FullName.Required'

-- Set email
update [dbo].[LocaleStringResource] set value = 'Email' where Name = 'contactus.email'
update [dbo].[LocaleStringResource] set value = 'Enter your email address.' where Name = 'ContactUs.Email.Hint'
update [dbo].[LocaleStringResource] set value = 'Enter email' where Name = 'ContactUs.Email.Required'

-- Set phone
IF EXISTS (SELECT * FROM [dbo].[LocaleStringResource] WHERE Name = 'contactus.phone')
BEGIN
update [dbo].[LocaleStringResource] set value = 'Phone' where Name = 'contactus.phone'
END
ELSE
BEGIN
Insert into [dbo].[LocaleStringResource] (Name, value) values ('contactus.phone', 'Phone')
END

IF EXISTS (SELECT * FROM [dbo].[LocaleStringResource] WHERE Name = 'ContactUs.Phone.hint')
BEGIN
update [dbo].[LocaleStringResource] set value = 'Enter your phone.' where Name = 'ContactUs.Phone.hint'
END
ELSE
BEGIN
Insert into [dbo].[LocaleStringResource] (Name, value) values ('ContactUs.Phone.hint', 'Enter your phone.')
END

IF EXISTS (SELECT * FROM [dbo].[LocaleStringResource] WHERE Name = 'ContactUs.Phone.Required')
BEGIN
update [dbo].[LocaleStringResource] set value = 'Enter phone.' where Name = 'ContactUs.Phone.Required'
END
ELSE
BEGIN
Insert into [dbo].[LocaleStringResource] (Name, value) values ('ContactUs.Phone.Required', 'Enter phone.')
END

-- Set message
update [dbo].[LocaleStringResource] set value = 'Message' where Name = 'contactus.enquiry'
update [dbo].[LocaleStringResource] set value = 'Enter your message.' where Name = 'ContactUs.enquiry.Hint'
update [dbo].[LocaleStringResource] set value = 'Enter message' where Name = 'ContactUs.enquiry.Required'

-- Set phone
IF EXISTS (SELECT * FROM [dbo].[LocaleStringResource] WHERE Name = 'ContactUs.Subscribe')
BEGIN
update [dbo].[LocaleStringResource] set value = 'Subscribe for our latest products and services' where Name = 'ContactUs.Subscribe'
END
ELSE
BEGIN
Insert into [dbo].[LocaleStringResource] (Name, value) values ('ContactUs.Subscribe', 'Subscribe for our latest products and services')
END