

-- Settings Table

-- Removes "Powered by nopCommerce" link
update [dbo].[Setting] set value = '' where Name = 'adminareasettings.lastnewstitleadminarea'

-- Removes "Powered by nopCommerce" link
update [dbo].[Setting] set value = 'True' where Name = 'storeinformationsettings.hidepoweredbynopcommerce'

-- Store Facebook
update [dbo].[Setting] set value = 'https://www.facebook.com/UniglobeInt' where Name = 'storeinformationsettings.facebooklink'

-- Store Facebook
update [dbo].[Setting] set value = 'https://twitter.com/UniglobeInt' where Name = 'storeinformationsettings.twitterlink'

-- Store Facebook
update [dbo].[Setting] set value = 'https://www.youtube.com/UniglobeInt' where Name = 'storeinformationsettings.youtubelink'

-- --Disable (or enable) Shopping Cart for all users (customer roles)

-- --Show current permission role mappings for 'Show Shopping Cart' permission
--SELECT TOP (100) pr.Name as Permission,  prm.[PermissionRecord_Id], prm.[CustomerRole_Id], cr.Name as customerRole
--  FROM [dbo].[PermissionRecord] pr 
--  INNER JOIN [dbo].[PermissionRecord_Role_Mapping] prm ON pr.Id = prm.PermissionRecord_Id
--  INNER JOIN [dbo].CustomerRole cr ON cr.Id = prm.CustomerRole_Id
--  where pr.Id = 47

-- Disable 'Shopping Cart' for 'Administrators', 'Forum Moderators', 'Registered' and 'Guests' customer roles
-- 'Administrators'
IF EXISTS (SELECT * FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 1)
	DELETE FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 1 -- Administrators
-- 'Forum Moderators'
IF EXISTS (SELECT * FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 2)
	DELETE FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 2 -- Forum Moderators
-- 'Registered'
IF EXISTS (SELECT * FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 3)
	DELETE FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 3 -- Registered
-- 'Guests'
IF EXISTS (SELECT * FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 4)
	DELETE FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 4 -- Guests
GO

---- Enable 'Shopping Cart' for 'Administrators', 'Forum Moderators', 'Registered' and 'Guests' customer roles
---- 'Administrators'
--IF NOT EXISTS (SELECT * FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 1)
--	INSERT INTO [dbo].[PermissionRecord_Role_Mapping] ([PermissionRecord_Id],[CustomerRole_Id]) VALUES (47, 1)
---- 'Forum Moderators'
--IF NOT EXISTS (SELECT * FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 2)
--	INSERT INTO [dbo].[PermissionRecord_Role_Mapping] ([PermissionRecord_Id],[CustomerRole_Id]) VALUES (47, 2)
---- 'Registered'
--IF NOT EXISTS (SELECT * FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 3)
--	INSERT INTO [dbo].[PermissionRecord_Role_Mapping] ([PermissionRecord_Id],[CustomerRole_Id]) VALUES (47, 3)
---- 'Guests'
--IF NOT EXISTS (SELECT * FROM [dbo].[PermissionRecord_Role_Mapping] WHERE [PermissionRecord_Id] = 47 AND [CustomerRole_Id] = 4)
--	INSERT INTO [dbo].[PermissionRecord_Role_Mapping] ([PermissionRecord_Id],[CustomerRole_Id]) VALUES (47, 4)
--GO



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
Insert into [dbo].[LocaleStringResource] (ResourceName, ResourceValue, LanguageId) values ('contactus.phone', 'Phone', 1)
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
