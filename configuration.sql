

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