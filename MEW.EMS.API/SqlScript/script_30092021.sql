USE [ideaXERP]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'V_ProductSupplier', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductSupplier'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'V_ProductSupplier', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductSupplier'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'V_ProductSubGroup', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductSubGroup'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'V_ProductSubGroup', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductSubGroup'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'V_ProductAttribute', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductAttribute'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'V_ProductAttribute', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductAttribute'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'V_Product', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Product'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'V_Product', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Product'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'V_MasterProductAttributeItem', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_MasterProductAttributeItem'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'V_MasterProductAttributeItem', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_MasterProductAttributeItem'
GO
/****** Object:  StoredProcedure [dbo].[xsp_getUserSubMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[xsp_getUserSubMenu]
GO
/****** Object:  StoredProcedure [dbo].[xsp_getUserRoleMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[xsp_getUserRoleMenu]
GO
/****** Object:  StoredProcedure [dbo].[xsp_getUserMainMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[xsp_getUserMainMenu]
GO
/****** Object:  StoredProcedure [dbo].[xsp_getUserCompaniesList]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[xsp_getUserCompaniesList]
GO
/****** Object:  StoredProcedure [dbo].[xsp_getUserBranchesList]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[xsp_getUserBranchesList]
GO
/****** Object:  StoredProcedure [dbo].[xsp_getSystemRole]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[xsp_getSystemRole]
GO
/****** Object:  StoredProcedure [dbo].[xsp_getClientBalanceList]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[xsp_getClientBalanceList]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT IF EXISTS [FK_UserRole_SystemUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT IF EXISTS [FK_UserRole_SystemRole]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserCompany]') AND type in (N'U'))
ALTER TABLE [dbo].[UserCompany] DROP CONSTRAINT IF EXISTS [FK_UserCompany_SystemUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserCompany]') AND type in (N'U'))
ALTER TABLE [dbo].[UserCompany] DROP CONSTRAINT IF EXISTS [FK_UserCompany_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBranch]') AND type in (N'U'))
ALTER TABLE [dbo].[UserBranch] DROP CONSTRAINT IF EXISTS [FK_UserBranch_SystemUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBranch]') AND type in (N'U'))
ALTER TABLE [dbo].[UserBranch] DROP CONSTRAINT IF EXISTS [FK_UserBranch_Branch]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type in (N'U'))
ALTER TABLE [dbo].[SystemUser] DROP CONSTRAINT IF EXISTS [FK_User_Enterprise]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemRole]') AND type in (N'U'))
ALTER TABLE [dbo].[SystemRole] DROP CONSTRAINT IF EXISTS [FK_SystemRole_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suspend]') AND type in (N'U'))
ALTER TABLE [dbo].[Suspend] DROP CONSTRAINT IF EXISTS [FK_Suspend_SystemUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubProductType]') AND type in (N'U'))
ALTER TABLE [dbo].[SubProductType] DROP CONSTRAINT IF EXISTS [FK_SubProductType_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubMenuRole]') AND type in (N'U'))
ALTER TABLE [dbo].[SubMenuRole] DROP CONSTRAINT IF EXISTS [FK_SubMenuRole_SystemRole]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubMenuRole]') AND type in (N'U'))
ALTER TABLE [dbo].[SubMenuRole] DROP CONSTRAINT IF EXISTS [FK_SubMenuRole_SubMenu]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[SubMenu] DROP CONSTRAINT IF EXISTS [FK_SubMenu_MainMenu]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [FK_StockReturnOrder_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[RoleSubMenu] DROP CONSTRAINT IF EXISTS [FK_RoleSubMenu_SystemRole]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[RoleSubMenu] DROP CONSTRAINT IF EXISTS [FK_RoleSubMenu_AppSubMenu]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrderItem]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrderItem] DROP CONSTRAINT IF EXISTS [FK_PurchaseOrderItem_PurchaseOrder]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrderItem]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrderItem] DROP CONSTRAINT IF EXISTS [FK_PurchaseOrderItem_Product]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [FK_PurchaseOrder_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [FK_PurchaseOrder_ClientType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSupplier]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductSupplier] DROP CONSTRAINT IF EXISTS [FK_ProductSupplier_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductSubGroup] DROP CONSTRAINT IF EXISTS [FK_ProductSubGroup_ProductGroup]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductImge]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductImge] DROP CONSTRAINT IF EXISTS [FK_ProductImge_Product]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductGroup]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductGroup] DROP CONSTRAINT IF EXISTS [FK_ProductGroup_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBundleUp]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductBundleUp] DROP CONSTRAINT IF EXISTS [FK_ProductBundleUp_SubProductType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBarcode]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductBarcode] DROP CONSTRAINT IF EXISTS [FK_ProductBarcode_Product]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttributeItem]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttributeItem] DROP CONSTRAINT IF EXISTS [FK_ProductAttributeItem_ProductAttribute]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttributeItem]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttributeItem] DROP CONSTRAINT IF EXISTS [FK_ProductAttributeItem_MasterProductAttributeItem]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttribute]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttribute] DROP CONSTRAINT IF EXISTS [FK_ProductAttribute_Product]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttribute]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttribute] DROP CONSTRAINT IF EXISTS [FK_ProductAttribute_MasterProductAttribute]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [FK_Product_ProductSupplier]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [FK_Product_ProductSubGroup]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalSalaryType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalSalaryType] DROP CONSTRAINT IF EXISTS [FK_PersonalSalaryType_Personal]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalSalaryType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalSalaryType] DROP CONSTRAINT IF EXISTS [FK_PersonalSalaryType_MasterSalaryType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalOverTimeType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalOverTimeType] DROP CONSTRAINT IF EXISTS [FK_PersonalOverTimeType_Personal]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalOverTimeType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalOverTimeType] DROP CONSTRAINT IF EXISTS [FK_PersonalOverTimeType_MasterOverTimeType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalLoan]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalLoan] DROP CONSTRAINT IF EXISTS [FK_PersonalLoan_Personal]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalLoan]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalLoan] DROP CONSTRAINT IF EXISTS [FK_PersonalLoan_MasterLoanType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalEmployeeType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalEmployeeType] DROP CONSTRAINT IF EXISTS [FK_PersonalEmployeeType_Personal]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalEmployeeType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalEmployeeType] DROP CONSTRAINT IF EXISTS [FK_PersonalEmployeeType_MasterEmployeeType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalAllowanceType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalAllowanceType] DROP CONSTRAINT IF EXISTS [FK_PersonalAllowanceType_Personal]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalAllowanceType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalAllowanceType] DROP CONSTRAINT IF EXISTS [FK_PersonalAllowanceType_MasterAllowanceType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Personal]') AND type in (N'U'))
ALTER TABLE [dbo].[Personal] DROP CONSTRAINT IF EXISTS [FK_Personal_MasterTerminationType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Personal]') AND type in (N'U'))
ALTER TABLE [dbo].[Personal] DROP CONSTRAINT IF EXISTS [FK_Personal_MasterGender]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentType]') AND type in (N'U'))
ALTER TABLE [dbo].[PaymentType] DROP CONSTRAINT IF EXISTS [FK_PaymentType_Enterprise]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [FK_Payment_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterTerminationType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterTerminationType] DROP CONSTRAINT IF EXISTS [FK_MasterTerminationType_Enterprise]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterSalaryType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterSalaryType] DROP CONSTRAINT IF EXISTS [FK_MasterSalaryType_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterProductAttributeItem]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterProductAttributeItem] DROP CONSTRAINT IF EXISTS [FK_MasterProductAttributeItem_MasterProductAttribute]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterOverTimeType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterOverTimeType] DROP CONSTRAINT IF EXISTS [FK_MasterOverTimeType_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterLeaveType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterLeaveType] DROP CONSTRAINT IF EXISTS [FK_MasterLeaveType_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterGender]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterGender] DROP CONSTRAINT IF EXISTS [FK_MasterGender_Enterprise]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterEmployeeType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterEmployeeType] DROP CONSTRAINT IF EXISTS [FK_MasterEmployeeType_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MainMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[MainMenu] DROP CONSTRAINT IF EXISTS [FK_MainMenu_Enterprise]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distributor]') AND type in (N'U'))
ALTER TABLE [dbo].[Distributor] DROP CONSTRAINT IF EXISTS [FK_Distributor_PaymentType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distributor]') AND type in (N'U'))
ALTER TABLE [dbo].[Distributor] DROP CONSTRAINT IF EXISTS [FK_Distributor_Enterprise]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [FK_DispatchOrder_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company]') AND type in (N'U'))
ALTER TABLE [dbo].[Company] DROP CONSTRAINT IF EXISTS [FK_Company_Enterprise]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientType]') AND type in (N'U'))
ALTER TABLE [dbo].[ClientType] DROP CONSTRAINT IF EXISTS [FK_VendorType_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Branch]') AND type in (N'U'))
ALTER TABLE [dbo].[Branch] DROP CONSTRAINT IF EXISTS [FK_Branch_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[AppSubMenu] DROP CONSTRAINT IF EXISTS [FK_AppSubMenu_AppMainMenu]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppMainMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[AppMainMenu] DROP CONSTRAINT IF EXISTS [FK_AppMainMenu_Enterprise]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Warehouse]') AND type in (N'U'))
ALTER TABLE [dbo].[Warehouse] DROP CONSTRAINT IF EXISTS [DF_Warehouse_IsSync]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Warehouse]') AND type in (N'U'))
ALTER TABLE [dbo].[Warehouse] DROP CONSTRAINT IF EXISTS [DF_Warehouse_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Warehouse]') AND type in (N'U'))
ALTER TABLE [dbo].[Warehouse] DROP CONSTRAINT IF EXISTS [DF_Warehouse_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Warehouse]') AND type in (N'U'))
ALTER TABLE [dbo].[Warehouse] DROP CONSTRAINT IF EXISTS [DF_Warehouse_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT IF EXISTS [defval_UserRole]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT IF EXISTS [DF_UserRole_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT IF EXISTS [DF_UserRole_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserCompany]') AND type in (N'U'))
ALTER TABLE [dbo].[UserCompany] DROP CONSTRAINT IF EXISTS [defval_UserCompany]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserCompany]') AND type in (N'U'))
ALTER TABLE [dbo].[UserCompany] DROP CONSTRAINT IF EXISTS [DF_UserCompany_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserCompany]') AND type in (N'U'))
ALTER TABLE [dbo].[UserCompany] DROP CONSTRAINT IF EXISTS [DF_UserCompany_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBranch]') AND type in (N'U'))
ALTER TABLE [dbo].[UserBranch] DROP CONSTRAINT IF EXISTS [defval_UserBranch]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBranch]') AND type in (N'U'))
ALTER TABLE [dbo].[UserBranch] DROP CONSTRAINT IF EXISTS [DF_UserBranch_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBranch]') AND type in (N'U'))
ALTER TABLE [dbo].[UserBranch] DROP CONSTRAINT IF EXISTS [DF_UserBranch_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type in (N'U'))
ALTER TABLE [dbo].[SystemUser] DROP CONSTRAINT IF EXISTS [defval_SystemUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type in (N'U'))
ALTER TABLE [dbo].[SystemUser] DROP CONSTRAINT IF EXISTS [DF_User_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type in (N'U'))
ALTER TABLE [dbo].[SystemUser] DROP CONSTRAINT IF EXISTS [DF_User_IsSuperUser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type in (N'U'))
ALTER TABLE [dbo].[SystemUser] DROP CONSTRAINT IF EXISTS [DF_User_IsLockedOut]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type in (N'U'))
ALTER TABLE [dbo].[SystemUser] DROP CONSTRAINT IF EXISTS [DF_User_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemRole]') AND type in (N'U'))
ALTER TABLE [dbo].[SystemRole] DROP CONSTRAINT IF EXISTS [defval_SystemRole]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemRole]') AND type in (N'U'))
ALTER TABLE [dbo].[SystemRole] DROP CONSTRAINT IF EXISTS [DF_SystemRole_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suspend]') AND type in (N'U'))
ALTER TABLE [dbo].[Suspend] DROP CONSTRAINT IF EXISTS [DF_Suspend_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suspend]') AND type in (N'U'))
ALTER TABLE [dbo].[Suspend] DROP CONSTRAINT IF EXISTS [DF_Suspend_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubProductType]') AND type in (N'U'))
ALTER TABLE [dbo].[SubProductType] DROP CONSTRAINT IF EXISTS [DF_SubProductType_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubProductType]') AND type in (N'U'))
ALTER TABLE [dbo].[SubProductType] DROP CONSTRAINT IF EXISTS [DF_SubProductType_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubProductType]') AND type in (N'U'))
ALTER TABLE [dbo].[SubProductType] DROP CONSTRAINT IF EXISTS [DF_SubProductType_Active]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [DF_StockReturnOrder_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [DF_StockReturnOrder_Status]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [DF_StockReturnOrder_NetAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [DF_StockReturnOrder_ReturnedAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [DF_StockReturnOrder_DiscountAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [DF_StockReturnOrder_DiscountPercentage]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [DF_StockReturnOrder_DistributorValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [DF_StockReturnOrder_RetailValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [DF_StockReturnOrder_WholesaleValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [DF_StockReturnOrder_CostValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockReturnOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[StockReturnOrder] DROP CONSTRAINT IF EXISTS [DF_StockReturnOrder_DatePrepared]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[RoleSubMenu] DROP CONSTRAINT IF EXISTS [defval_RoleSubMenu]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[RoleSubMenu] DROP CONSTRAINT IF EXISTS [DF_RoleSubMenu_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[RoleSubMenu] DROP CONSTRAINT IF EXISTS [DF_RoleSubMenu_AccessDelete]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[RoleSubMenu] DROP CONSTRAINT IF EXISTS [DF_RoleSubMenu_AccessEdit]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[RoleSubMenu] DROP CONSTRAINT IF EXISTS [DF_RoleSubMenu_AccessAdd]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[RoleSubMenu] DROP CONSTRAINT IF EXISTS [DF_RoleSubMenu_AccessView]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[RoleSubMenu] DROP CONSTRAINT IF EXISTS [DF_RoleSubMenu_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrderItem]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrderItem] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrderItem_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrder_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrder_Status]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrder_NetAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrder_ReturnedAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrder_DiscountAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrder_DiscountPercentage]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrder_DistributorValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrder_RetailValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrder_WholesaleValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrder_CostValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT IF EXISTS [DF_PurchaseOrder_DatePrepared]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSupplier]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductSupplier] DROP CONSTRAINT IF EXISTS [DF_ProductSupplier_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSupplier]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductSupplier] DROP CONSTRAINT IF EXISTS [DF_ProductSupplier_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSupplier]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductSupplier] DROP CONSTRAINT IF EXISTS [DF_ProductSupplier_Active]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductSubGroup] DROP CONSTRAINT IF EXISTS [DF_ProductSubGroup_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductSubGroup] DROP CONSTRAINT IF EXISTS [DF_ProductSubGroup_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductSubGroup] DROP CONSTRAINT IF EXISTS [DF_ProductSubGroup_Active]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductImge]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductImge] DROP CONSTRAINT IF EXISTS [DF_ProductImge_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductGroup]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductGroup] DROP CONSTRAINT IF EXISTS [DF_ProductGroup_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductGroup]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductGroup] DROP CONSTRAINT IF EXISTS [DF_ProductGroup_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductGroup]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductGroup] DROP CONSTRAINT IF EXISTS [DF_ProductGroup_Active]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBundleUp]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductBundleUp] DROP CONSTRAINT IF EXISTS [DF_ProductBundleUp_Price]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBundleUp]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductBundleUp] DROP CONSTRAINT IF EXISTS [DF_ProductBundleUp_MaximumQty]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBundleUp]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductBundleUp] DROP CONSTRAINT IF EXISTS [DF_ProductBundleUp_MinimumQty]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBundleUp]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductBundleUp] DROP CONSTRAINT IF EXISTS [DF_ProductBundleUp_IsMandatory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBundleUp]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductBundleUp] DROP CONSTRAINT IF EXISTS [DF_ProductBundleUp_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBarcode]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductBarcode] DROP CONSTRAINT IF EXISTS [DF_ProductBarcode_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBarcode]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductBarcode] DROP CONSTRAINT IF EXISTS [DF_ProductBarcode_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBarcode]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductBarcode] DROP CONSTRAINT IF EXISTS [DF_ProductBarcode_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttributeItem]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttributeItem] DROP CONSTRAINT IF EXISTS [DF_ProductAttributeItem_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttributeItem]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttributeItem] DROP CONSTRAINT IF EXISTS [DF_ProductAttributeItem_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttributeItem]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttributeItem] DROP CONSTRAINT IF EXISTS [DF_ProductAttributeItem_MasterProductAttributeItemId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttributeItem]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttributeItem] DROP CONSTRAINT IF EXISTS [DF_ProductAttributeItem_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttribute]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttribute] DROP CONSTRAINT IF EXISTS [DF_ProductAttributeGroup_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttribute]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttribute] DROP CONSTRAINT IF EXISTS [DF_ProductAttributeGroup_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttribute]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttribute] DROP CONSTRAINT IF EXISTS [DF_ProductAttribute_IsMandatory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttribute]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductAttribute] DROP CONSTRAINT IF EXISTS [DF_ProductAttributeGroup_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_Active]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_Attribute]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_Roq]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_Rol]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_TrackInventory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_MonitorExpiry]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_IsReturnable]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_IsOpenPrice]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_DistributorPrice]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_WholesalePrice]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_RetailPrice]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_MinimumPrice]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT IF EXISTS [DF_Product_CostPrice]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalSalaryType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalSalaryType] DROP CONSTRAINT IF EXISTS [defval_PersonalSalaryType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalSalaryType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalSalaryType] DROP CONSTRAINT IF EXISTS [DF_PersonalSalaryType_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalSalaryType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalSalaryType] DROP CONSTRAINT IF EXISTS [DF_PersonalSalaryType_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalOverTimeType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalOverTimeType] DROP CONSTRAINT IF EXISTS [defval_PersonalOverTimeType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalOverTimeType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalOverTimeType] DROP CONSTRAINT IF EXISTS [DF_PersonalOverTimeType_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalOverTimeType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalOverTimeType] DROP CONSTRAINT IF EXISTS [DF_PersonalOverTimeType_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalLoan]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalLoan] DROP CONSTRAINT IF EXISTS [defval_PersonalLoan]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalLoan]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalLoan] DROP CONSTRAINT IF EXISTS [DF_PersonalLoan_Status]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalLoan]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalLoan] DROP CONSTRAINT IF EXISTS [DF_PersonalLoan_AmountRequested]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalLoan]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalLoan] DROP CONSTRAINT IF EXISTS [DF_PersonalLoan_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalEmployeeType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalEmployeeType] DROP CONSTRAINT IF EXISTS [defval_PersonalEmployeeType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalEmployeeType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalEmployeeType] DROP CONSTRAINT IF EXISTS [DF_PersonalEmployeeType_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalEmployeeType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalEmployeeType] DROP CONSTRAINT IF EXISTS [DF_PersonalEmployeeType_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalAllowanceType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalAllowanceType] DROP CONSTRAINT IF EXISTS [defval_PersonalAllowanceType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalAllowanceType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalAllowanceType] DROP CONSTRAINT IF EXISTS [DF_PersonalAllowanceType_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalAllowanceType]') AND type in (N'U'))
ALTER TABLE [dbo].[PersonalAllowanceType] DROP CONSTRAINT IF EXISTS [DF_PersonalAllowanceType_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Personal]') AND type in (N'U'))
ALTER TABLE [dbo].[Personal] DROP CONSTRAINT IF EXISTS [defval_Personal]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Personal]') AND type in (N'U'))
ALTER TABLE [dbo].[Personal] DROP CONSTRAINT IF EXISTS [DF_Personal_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Personal]') AND type in (N'U'))
ALTER TABLE [dbo].[Personal] DROP CONSTRAINT IF EXISTS [DF_Personal_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Personal]') AND type in (N'U'))
ALTER TABLE [dbo].[Personal] DROP CONSTRAINT IF EXISTS [DF_Personal_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Personal]') AND type in (N'U'))
ALTER TABLE [dbo].[Personal] DROP CONSTRAINT IF EXISTS [DF_Personal_BasicSalary]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Personal]') AND type in (N'U'))
ALTER TABLE [dbo].[Personal] DROP CONSTRAINT IF EXISTS [DF_Personal_IsEPF]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentType]') AND type in (N'U'))
ALTER TABLE [dbo].[PaymentType] DROP CONSTRAINT IF EXISTS [DF_PaymentType_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentType]') AND type in (N'U'))
ALTER TABLE [dbo].[PaymentType] DROP CONSTRAINT IF EXISTS [DF_PaymentType_IsSync]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentType]') AND type in (N'U'))
ALTER TABLE [dbo].[PaymentType] DROP CONSTRAINT IF EXISTS [DF_PaymentType_IsDelete]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentType]') AND type in (N'U'))
ALTER TABLE [dbo].[PaymentType] DROP CONSTRAINT IF EXISTS [DF_PaymentType_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_Status]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_PaidAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_NetAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_ReturnedAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_DiscountAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_DiscountPercentage]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_DistributorValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_RetailValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_WholesaleValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_CostValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT IF EXISTS [DF_Payment_DatePrepared]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterTerminationType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterTerminationType] DROP CONSTRAINT IF EXISTS [defval_MasterTerminationType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterTerminationType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterTerminationType] DROP CONSTRAINT IF EXISTS [DF_MasterTerminationType_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterTerminationType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterTerminationType] DROP CONSTRAINT IF EXISTS [DF_MasterTerminationType_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterTerminationType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterTerminationType] DROP CONSTRAINT IF EXISTS [DF_MasterTerminationType_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterSalaryType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterSalaryType] DROP CONSTRAINT IF EXISTS [defval_MasterSalaryType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterSalaryType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterSalaryType] DROP CONSTRAINT IF EXISTS [DF_MasterSalaryType_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterSalaryType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterSalaryType] DROP CONSTRAINT IF EXISTS [DF_MasterSalaryType_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterSalaryType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterSalaryType] DROP CONSTRAINT IF EXISTS [DF_MasterSalaryType_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterProductAttributeItem]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterProductAttributeItem] DROP CONSTRAINT IF EXISTS [DF_MasterProductAttributeItem_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterProductAttributeItem]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterProductAttributeItem] DROP CONSTRAINT IF EXISTS [DF_MasterProductAttributeItem_NId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterProductAttribute]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterProductAttribute] DROP CONSTRAINT IF EXISTS [DF_MasterProductAttribute_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterProductAttribute]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterProductAttribute] DROP CONSTRAINT IF EXISTS [DF_MasterProductAttribute_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterProductAttribute]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterProductAttribute] DROP CONSTRAINT IF EXISTS [DF_MasterProductAttribute_Active]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterOverTimeType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterOverTimeType] DROP CONSTRAINT IF EXISTS [defval_MasterOverTimeType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterOverTimeType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterOverTimeType] DROP CONSTRAINT IF EXISTS [DF_MasterOverTimeType_Rate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterLoanType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterLoanType] DROP CONSTRAINT IF EXISTS [defval_MasterLoanType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterLoanType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterLoanType] DROP CONSTRAINT IF EXISTS [DF_MasterLoanType_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterLoanType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterLoanType] DROP CONSTRAINT IF EXISTS [DF_MasterLoanType_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterLoanType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterLoanType] DROP CONSTRAINT IF EXISTS [DF_MasterLoanType_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterLeaveType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterLeaveType] DROP CONSTRAINT IF EXISTS [defval_MasterLeaveType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterLeaveType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterLeaveType] DROP CONSTRAINT IF EXISTS [DF_MasterLeaveType_NoDays]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterGender]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterGender] DROP CONSTRAINT IF EXISTS [defval_MasterGender]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterGender]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterGender] DROP CONSTRAINT IF EXISTS [DF_MasterGender_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterGender]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterGender] DROP CONSTRAINT IF EXISTS [DF_MasterGender_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterGender]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterGender] DROP CONSTRAINT IF EXISTS [DF_MasterGender_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterEmployeeType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterEmployeeType] DROP CONSTRAINT IF EXISTS [defval_MasterEmployeeType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterEmployeeType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterEmployeeType] DROP CONSTRAINT IF EXISTS [DF_MasterEmployeeType_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterEmployeeType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterEmployeeType] DROP CONSTRAINT IF EXISTS [DF_MasterEmployeeType_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterEmployeeType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterEmployeeType] DROP CONSTRAINT IF EXISTS [DF_MasterEmployeeType_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterAllowanceType]') AND type in (N'U'))
ALTER TABLE [dbo].[MasterAllowanceType] DROP CONSTRAINT IF EXISTS [defval_MasterAllowanceType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enterprise]') AND type in (N'U'))
ALTER TABLE [dbo].[Enterprise] DROP CONSTRAINT IF EXISTS [DF_Enterprise_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enterprise]') AND type in (N'U'))
ALTER TABLE [dbo].[Enterprise] DROP CONSTRAINT IF EXISTS [DF_Enterprise_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enterprise]') AND type in (N'U'))
ALTER TABLE [dbo].[Enterprise] DROP CONSTRAINT IF EXISTS [DF_Enterprise_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enterprise]') AND type in (N'U'))
ALTER TABLE [dbo].[Enterprise] DROP CONSTRAINT IF EXISTS [DF_Enterprise_DateRegistered]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distributor]') AND type in (N'U'))
ALTER TABLE [dbo].[Distributor] DROP CONSTRAINT IF EXISTS [DF_Distributor_IsSync]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distributor]') AND type in (N'U'))
ALTER TABLE [dbo].[Distributor] DROP CONSTRAINT IF EXISTS [DF_Distributor_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distributor]') AND type in (N'U'))
ALTER TABLE [dbo].[Distributor] DROP CONSTRAINT IF EXISTS [DF_Distributor_IsDelete]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distributor]') AND type in (N'U'))
ALTER TABLE [dbo].[Distributor] DROP CONSTRAINT IF EXISTS [DF_Distributor_IsSuspect]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distributor]') AND type in (N'U'))
ALTER TABLE [dbo].[Distributor] DROP CONSTRAINT IF EXISTS [DF_Distributor_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distributor]') AND type in (N'U'))
ALTER TABLE [dbo].[Distributor] DROP CONSTRAINT IF EXISTS [DF_Distributor_CreditPeriod]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distributor]') AND type in (N'U'))
ALTER TABLE [dbo].[Distributor] DROP CONSTRAINT IF EXISTS [DF_Distributor_DepositAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [DF_DispatchOrder_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [DF_DispatchOrder_Status]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [DF_DispatchOrder_NetAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [DF_DispatchOrder_ReturnedAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [DF_DispatchOrder_DiscountAmount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [DF_DispatchOrder_DiscountPercentage]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [DF_DispatchOrder_DistributorValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [DF_DispatchOrder_RetailValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [DF_DispatchOrder_WholesaleValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [DF_DispatchOrder_CostValue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DispatchOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[DispatchOrder] DROP CONSTRAINT IF EXISTS [DF_DispatchOrder_DatePrepared]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company]') AND type in (N'U'))
ALTER TABLE [dbo].[Company] DROP CONSTRAINT IF EXISTS [defval_Company]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company]') AND type in (N'U'))
ALTER TABLE [dbo].[Company] DROP CONSTRAINT IF EXISTS [DF_Company_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company]') AND type in (N'U'))
ALTER TABLE [dbo].[Company] DROP CONSTRAINT IF EXISTS [DF_Company_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientType]') AND type in (N'U'))
ALTER TABLE [dbo].[ClientType] DROP CONSTRAINT IF EXISTS [DF_VendorType_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientType]') AND type in (N'U'))
ALTER TABLE [dbo].[ClientType] DROP CONSTRAINT IF EXISTS [DF_VendorType_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Branch]') AND type in (N'U'))
ALTER TABLE [dbo].[Branch] DROP CONSTRAINT IF EXISTS [defval_Branch]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Branch]') AND type in (N'U'))
ALTER TABLE [dbo].[Branch] DROP CONSTRAINT IF EXISTS [DF_Branch_Tstamp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Branch]') AND type in (N'U'))
ALTER TABLE [dbo].[Branch] DROP CONSTRAINT IF EXISTS [DF_Branch_IsDeleted]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Branch]') AND type in (N'U'))
ALTER TABLE [dbo].[Branch] DROP CONSTRAINT IF EXISTS [DF_Branch_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[AppSubMenu] DROP CONSTRAINT IF EXISTS [defval_AppSubMenu]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppSubMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[AppSubMenu] DROP CONSTRAINT IF EXISTS [DF_AppSubMenu_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppMainMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[AppMainMenu] DROP CONSTRAINT IF EXISTS [defval_AppMainMenu]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppMainMenu]') AND type in (N'U'))
ALTER TABLE [dbo].[AppMainMenu] DROP CONSTRAINT IF EXISTS [DF_AppMainMenu_IsActive]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Warehouse]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[UserRole]
GO
/****** Object:  Table [dbo].[UserCompany]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[UserCompany]
GO
/****** Object:  Table [dbo].[UserBranch]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[UserBranch]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[SystemUser]
GO
/****** Object:  Table [dbo].[SystemRole]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[SystemRole]
GO
/****** Object:  Table [dbo].[Suspend]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Suspend]
GO
/****** Object:  Table [dbo].[SubProductType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[SubProductType]
GO
/****** Object:  Table [dbo].[SubMenuRole]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[SubMenuRole]
GO
/****** Object:  Table [dbo].[SubMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[SubMenu]
GO
/****** Object:  Table [dbo].[StockReturnOrder]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[StockReturnOrder]
GO
/****** Object:  Table [dbo].[RoleSubMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[RoleSubMenu]
GO
/****** Object:  Table [dbo].[PurchaseOrderItem]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[PurchaseOrderItem]
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[PurchaseOrder]
GO
/****** Object:  Table [dbo].[ProductImge]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductImge]
GO
/****** Object:  Table [dbo].[ProductBundleUp]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductBundleUp]
GO
/****** Object:  Table [dbo].[ProductBarcode]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductBarcode]
GO
/****** Object:  Table [dbo].[PersonalSalaryType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[PersonalSalaryType]
GO
/****** Object:  Table [dbo].[PersonalOverTimeType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[PersonalOverTimeType]
GO
/****** Object:  Table [dbo].[PersonalLoan]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[PersonalLoan]
GO
/****** Object:  Table [dbo].[PersonalEmployeeType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[PersonalEmployeeType]
GO
/****** Object:  Table [dbo].[PersonalAllowanceType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[PersonalAllowanceType]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Personal]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[PaymentType]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Payment]
GO
/****** Object:  Table [dbo].[MasterTerminationType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[MasterTerminationType]
GO
/****** Object:  Table [dbo].[MasterSalaryType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[MasterSalaryType]
GO
/****** Object:  Table [dbo].[MasterOverTimeType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[MasterOverTimeType]
GO
/****** Object:  Table [dbo].[MasterLoanType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[MasterLoanType]
GO
/****** Object:  Table [dbo].[MasterLeaveType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[MasterLeaveType]
GO
/****** Object:  Table [dbo].[MasterGender]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[MasterGender]
GO
/****** Object:  Table [dbo].[MasterEmployeeType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[MasterEmployeeType]
GO
/****** Object:  Table [dbo].[MasterAllowanceType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[MasterAllowanceType]
GO
/****** Object:  Table [dbo].[MainMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[MainMenu]
GO
/****** Object:  Table [dbo].[Enterprise]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Enterprise]
GO
/****** Object:  Table [dbo].[Distributor]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Distributor]
GO
/****** Object:  Table [dbo].[DispatchOrder]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[DispatchOrder]
GO
/****** Object:  Table [dbo].[ClientType]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[ClientType]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Branch]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AppSubMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[AppSubMenu]
GO
/****** Object:  Table [dbo].[AppMainMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[AppMainMenu]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  View [dbo].[V_MasterProductAttributeItem]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP VIEW IF EXISTS [dbo].[V_MasterProductAttributeItem]
GO
/****** Object:  View [dbo].[V_ProductSupplier]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP VIEW IF EXISTS [dbo].[V_ProductSupplier]
GO
/****** Object:  Table [dbo].[ProductSupplier]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductSupplier]
GO
/****** Object:  View [dbo].[V_ProductSubGroup]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP VIEW IF EXISTS [dbo].[V_ProductSubGroup]
GO
/****** Object:  View [dbo].[V_Product]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP VIEW IF EXISTS [dbo].[V_Product]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Product]
GO
/****** Object:  Table [dbo].[ProductSubGroup]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductSubGroup]
GO
/****** Object:  Table [dbo].[ProductGroup]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductGroup]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Company]
GO
/****** Object:  View [dbo].[V_ProductAttribute]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP VIEW IF EXISTS [dbo].[V_ProductAttribute]
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductAttribute]
GO
/****** Object:  Table [dbo].[MasterProductAttributeItem]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[MasterProductAttributeItem]
GO
/****** Object:  Table [dbo].[ProductAttributeItem]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductAttributeItem]
GO
/****** Object:  Table [dbo].[MasterProductAttribute]    Script Date: 9/30/2021 9:15:59 PM ******/
DROP TABLE IF EXISTS [dbo].[MasterProductAttribute]
GO
/****** Object:  Table [dbo].[MasterProductAttribute]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterProductAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_MasterProductAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttributeItem]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttributeItem](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductAttributeId] [uniqueidentifier] NOT NULL,
	[MasterProductAttributeItemId] [uniqueidentifier] NOT NULL,
	[PriceAdjustment] [decimal](18, 3) NOT NULL,
	[SeqNo] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_ProductAttributeItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterProductAttributeItem]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterProductAttributeItem](
	[Id] [uniqueidentifier] NOT NULL,
	[MasterProductAttributeId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Tstamp] [datetime] NOT NULL,
 CONSTRAINT [PK_MasterProductAttributeItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductId] [int] NOT NULL,
	[MasterProductAttributeId] [int] NOT NULL,
	[IsMandatory] [bit] NOT NULL,
	[SeqNo] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_ProductAttributeGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_ProductAttribute]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ProductAttribute]
AS
SELECT        P.Id, P.ProductId, P.MasterProductAttributeId, P.IsMandatory, P.SeqNo, I.MasterProductAttributeItemId, I.Id AS ProductAttributeItemId, I.PriceAdjustment, I.SeqNo AS ProductAttributeItemSeqNo, A.Name AS MasterProductAttribute, 
                         M.Name AS MasterProductAttributeItem
FROM            dbo.ProductAttribute AS P INNER JOIN
                         dbo.ProductAttributeItem AS I ON P.Id = I.ProductAttributeId INNER JOIN
                         dbo.MasterProductAttribute AS A ON P.MasterProductAttributeId = A.Id INNER JOIN
                         dbo.MasterProductAttributeItem AS M ON I.MasterProductAttributeItemId = M.Id
GO
/****** Object:  Table [dbo].[Company]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnterpriseId] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGroup]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_ProductGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSubGroup]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSubGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductGroupId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_ProductSubGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubgroupId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductSupplierId] [int] NOT NULL,
	[CostPrice] [decimal](18, 3) NOT NULL,
	[MinimumPrice] [decimal](18, 3) NOT NULL,
	[RetailPrice] [decimal](18, 3) NOT NULL,
	[WholesalePrice] [decimal](18, 3) NOT NULL,
	[DistributorPrice] [decimal](18, 3) NOT NULL,
	[IsOpenPrice] [bit] NOT NULL,
	[IsReturnable] [bit] NOT NULL,
	[MonitorExpiry] [bit] NOT NULL,
	[TrackInventory] [bit] NOT NULL,
	[ROL] [decimal](18, 3) NOT NULL,
	[ROQ] [decimal](18, 3) NOT NULL,
	[Attribute] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Product]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Product]
AS
SELECT        P.Id, P.ProductSubgroupId, P.Name, P.ProductSupplierId, P.CostPrice, P.MinimumPrice, P.RetailPrice, P.WholesalePrice, P.DistributorPrice, P.IsOpenPrice, P.IsReturnable, P.MonitorExpiry, P.TrackInventory, P.ROL, P.ROQ, 
                         P.Attribute, P.Description, P.Active, P.IsDeleted, P.Tstamp, S.Name AS ProductSubGroup, G.Name AS ProductGroup, G.CompanyId, C.EnterpriseId
FROM            dbo.Product AS P INNER JOIN
                         dbo.ProductSubGroup AS S INNER JOIN
                         dbo.ProductGroup AS G ON S.ProductGroupId = G.Id ON P.ProductSubgroupId = S.Id INNER JOIN
                         dbo.Company AS C ON C.Id = G.CompanyId
GO
/****** Object:  View [dbo].[V_ProductSubGroup]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ProductSubGroup]
AS
SELECT        S.Id, S.ProductGroupId, S.Name, S.Description, S.Active, S.IsDeleted, S.Tstamp, G.Name AS ProductGroup, G.CompanyId, C.EnterpriseId
FROM            dbo.ProductSubGroup AS S INNER JOIN
                         dbo.ProductGroup AS G ON S.ProductGroupId = G.Id INNER JOIN
                         dbo.Company AS C ON C.Id = G.CompanyId
GO
/****** Object:  Table [dbo].[ProductSupplier]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSupplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NOT NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_ProductSupplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_ProductSupplier]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ProductSupplier]
AS
SELECT        S.Id, S.CompanyId, S.Name, S.Description, S.Address, S.ContactNo, S.Email, S.Active, S.IsDeleted, S.Tstamp, C.EnterpriseId
FROM            dbo.ProductSupplier AS S INNER JOIN
                         dbo.Company AS C ON S.CompanyId = C.Id
GO
/****** Object:  View [dbo].[V_MasterProductAttributeItem]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_MasterProductAttributeItem]
AS
SELECT        A.Id, A.CompanyId, A.Name, A.Description, A.Active, A.IsDeleted, A.Tstamp, I.Id AS MasterProductAttributeItemId, I.Name AS MasterProductAttributeItem, C.EnterpriseId
FROM            dbo.MasterProductAttribute AS A INNER JOIN
                         dbo.MasterProductAttributeItem AS I ON A.Id = I.MasterProductAttributeId INNER JOIN
                         dbo.Company AS C ON A.CompanyId = C.Id
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppMainMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppMainMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnterpriseId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](50) NOT NULL,
	[SeqNo] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_AppMainMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppSubMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppSubMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MainMenuId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](50) NOT NULL,
	[SeqNo] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_AppSubMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[EnterpriseId] [int] NOT NULL,
	[IsSuperUser] [bit] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Price] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Tstamp] [datetime] NOT NULL,
 CONSTRAINT [PK_VendorType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DispatchOrder]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DispatchOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[PurchaseOrderId] [int] NULL,
	[DatePrepared] [datetime] NOT NULL,
	[ClientId] [int] NOT NULL,
	[ClientTypeId] [int] NOT NULL,
	[CostValue] [decimal](18, 3) NOT NULL,
	[WholesaleValue] [decimal](18, 3) NOT NULL,
	[RetailValue] [decimal](18, 3) NOT NULL,
	[DistributorValue] [decimal](18, 3) NOT NULL,
	[DiscountPercentage] [int] NOT NULL,
	[DiscountAmount] [decimal](18, 3) NOT NULL,
	[ReturnedAmount] [decimal](18, 3) NOT NULL,
	[NetAmount] [decimal](18, 3) NOT NULL,
	[Status] [char](1) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CanceledBy] [uniqueidentifier] NULL,
	[CanceledDate] [datetime] NULL,
	[Tstamp] [datetime] NOT NULL,
 CONSTRAINT [PK_DispatchOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distributor]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distributor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnterpriseId] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Address] [nvarchar](250) NOT NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[DepositAmount] [decimal](18, 2) NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[CreditPeriod] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsSuspect] [bit] NULL,
	[SuspectReason] [nvarchar](max) NULL,
	[IsDelete] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_Distributor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enterprise]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enterprise](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DateRegistered] [datetime] NOT NULL,
	[DateApproved] [datetime] NULL,
	[ReferredBy] [nvarchar](50) NULL,
	[SubscriptionTypeId] [int] NOT NULL,
	[SubscriptionStartDate] [date] NOT NULL,
	[SubscriptionEndDate] [date] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_Enterprise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnterpriseId] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[icon] [nvarchar](50) NOT NULL,
	[caret] [nvarchar](50) NULL,
	[SeqNo] [int] NOT NULL,
	[url] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_MainMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterAllowanceType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterAllowanceType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Amount] [decimal](18, 2) NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_MasterAllowanceType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterEmployeeType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterEmployeeType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_MasterEmployeeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterGender]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterGender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnterpriseId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_MasterGender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterLeaveType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterLeaveType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[NoDays] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_MasterLeaveType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterLoanType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterLoanType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_MasterLoanType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterOverTimeType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterOverTimeType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_MasterOverTimeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterSalaryType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterSalaryType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[BasicSalary] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_MasterSalaryType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterTerminationType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterTerminationType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnterpriseId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_MasterTerminationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DatePrepared] [datetime] NOT NULL,
	[ClientId] [int] NOT NULL,
	[ClientTypeId] [int] NOT NULL,
	[CostValue] [decimal](18, 3) NOT NULL,
	[WholesaleValue] [decimal](18, 3) NOT NULL,
	[RetailValue] [decimal](18, 3) NOT NULL,
	[DistributorValue] [decimal](18, 3) NOT NULL,
	[DiscountPercentage] [int] NOT NULL,
	[DiscountAmount] [decimal](18, 3) NOT NULL,
	[ReturnedAmount] [decimal](18, 3) NOT NULL,
	[NetAmount] [decimal](18, 3) NOT NULL,
	[PaidAmount] [decimal](18, 3) NOT NULL,
	[Status] [char](1) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CanceledBy] [uniqueidentifier] NULL,
	[CanceledDate] [datetime] NULL,
	[Tstamp] [datetime] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnterpriseId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[IsSync] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[NIDNo] [nvarchar](50) NOT NULL,
	[IsEPF] [bit] NOT NULL,
	[EPFNo] [int] NULL,
	[BioId] [int] NULL,
	[DateRecruited] [datetime] NOT NULL,
	[DateTerminated] [datetime] NULL,
	[TerminationTypeId] [int] NULL,
	[GenderId] [int] NOT NULL,
	[BasicSalary] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalAllowanceType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalAllowanceType](
	[Id] [uniqueidentifier] NOT NULL,
	[PersonalId] [int] NOT NULL,
	[AllowanceTypeId] [int] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_PersonalAllowanceType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalEmployeeType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalEmployeeType](
	[Id] [uniqueidentifier] NOT NULL,
	[PersonalId] [int] NOT NULL,
	[EmployeeTypeId] [int] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_PersonalEmployeeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalLoan]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalLoan](
	[Id] [uniqueidentifier] NOT NULL,
	[PersonalId] [int] NOT NULL,
	[LoanTypeId] [int] NOT NULL,
	[AmountRequested] [decimal](18, 2) NOT NULL,
	[DateRequested] [datetime] NOT NULL,
	[AmountSanctioned] [decimal](18, 2) NULL,
	[DateSanctioned] [datetime] NULL,
	[Installment] [decimal](18, 2) NULL,
	[LoanTerms] [int] NULL,
	[DateDeductionStart] [datetime] NULL,
	[Status] [bit] NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_PersonalLoan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalOverTimeType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalOverTimeType](
	[Id] [uniqueidentifier] NOT NULL,
	[PersonalId] [int] NOT NULL,
	[OverTimeTypeId] [int] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_PersonalOverTimeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalSalaryType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalSalaryType](
	[Id] [uniqueidentifier] NOT NULL,
	[PersonalId] [int] NOT NULL,
	[SalaryTypeId] [int] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_PersonalSalaryType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductBarcode]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductBarcode](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Barcode] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Tstamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductBarcode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductBundleUp]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductBundleUp](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductId] [int] NOT NULL,
	[SubProductTypeId] [int] NOT NULL,
	[SubProductId] [int] NOT NULL,
	[IsMandatory] [bit] NOT NULL,
	[MinimumQty] [int] NOT NULL,
	[MaximumQty] [int] NOT NULL,
	[Price] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_ProductBundleUp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImge]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_ProductImge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DatePrepared] [datetime] NOT NULL,
	[ClientId] [int] NOT NULL,
	[ClientTypeId] [int] NOT NULL,
	[CostValue] [decimal](18, 3) NOT NULL,
	[WholesaleValue] [decimal](18, 3) NOT NULL,
	[RetailValue] [decimal](18, 3) NOT NULL,
	[DistributorValue] [decimal](18, 3) NOT NULL,
	[DiscountPercentage] [int] NOT NULL,
	[DiscountAmount] [decimal](18, 3) NOT NULL,
	[ReturnedAmount] [decimal](18, 3) NOT NULL,
	[NetAmount] [decimal](18, 3) NOT NULL,
	[Status] [char](1) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CanceledBy] [uniqueidentifier] NULL,
	[CanceledDate] [datetime] NULL,
	[Tstamp] [datetime] NOT NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderItem]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderItem](
	[Id] [uniqueidentifier] NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Qty] [decimal](18, 3) NOT NULL,
	[CostValue] [decimal](18, 3) NOT NULL,
	[WholesaleValue] [decimal](18, 3) NOT NULL,
	[RetailValue] [decimal](18, 3) NOT NULL,
	[DistributorValue] [decimal](18, 3) NOT NULL,
	[DiscountPercentage] [int] NOT NULL,
	[DiscountAmount] [decimal](18, 3) NOT NULL,
	[ReturnedAmount] [decimal](18, 3) NOT NULL,
	[NetAmount] [decimal](18, 3) NOT NULL,
	[Tstamp] [datetime] NOT NULL,
 CONSTRAINT [PK_PurchaseOrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleSubMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleSubMenu](
	[Id] [uniqueidentifier] NOT NULL,
	[SystemRoleId] [int] NOT NULL,
	[AppSubMenuId] [int] NOT NULL,
	[AccessView] [bit] NOT NULL,
	[AccessAdd] [bit] NOT NULL,
	[AccessEdit] [bit] NOT NULL,
	[AccessDelete] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_RoleSubMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockReturnOrder]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockReturnOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DatePrepared] [datetime] NOT NULL,
	[ClientId] [int] NOT NULL,
	[ClientTypeId] [int] NOT NULL,
	[CostValue] [decimal](18, 3) NOT NULL,
	[WholesaleValue] [decimal](18, 3) NOT NULL,
	[RetailValue] [decimal](18, 3) NOT NULL,
	[DistributorValue] [decimal](18, 3) NOT NULL,
	[DiscountPercentage] [int] NOT NULL,
	[DiscountAmount] [decimal](18, 3) NOT NULL,
	[ReturnedAmount] [decimal](18, 3) NOT NULL,
	[NetAmount] [decimal](18, 3) NOT NULL,
	[Status] [char](1) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CanceledBy] [uniqueidentifier] NULL,
	[CanceledDate] [datetime] NULL,
	[Tstamp] [datetime] NOT NULL,
 CONSTRAINT [PK_StockReturnOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MainMenuId] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[url] [nvarchar](50) NOT NULL,
	[SeqNo] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_SubMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubMenuRole]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubMenuRole](
	[Id] [uniqueidentifier] NOT NULL,
	[SystemRoleId] [int] NOT NULL,
	[AppSubMenuId] [int] NOT NULL,
	[AccessView] [bit] NOT NULL,
	[AccessAdd] [bit] NOT NULL,
	[AccessEdit] [bit] NOT NULL,
	[AccessDelete] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_SubMenuRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubProductType]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_SubProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suspend]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suspend](
	[Id] [uniqueidentifier] NOT NULL,
	[SystemUserId] [uniqueidentifier] NOT NULL,
	[EntityType] [nvarchar](50) NOT NULL,
	[EntityId] [int] NOT NULL,
	[Status] [char](1) NOT NULL,
	[Reason] [nvarchar](max) NULL,
	[Tstamp] [datetime] NULL,
 CONSTRAINT [PK_Suspend] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemRole]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_SystemRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUser](
	[Id] [uniqueidentifier] NOT NULL,
	[EnterpriseId] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[IsSuperUser] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBranch]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBranch](
	[Id] [uniqueidentifier] NOT NULL,
	[SystemUserId] [uniqueidentifier] NOT NULL,
	[BranchId] [int] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_UserBranch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCompany]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCompany](
	[Id] [uniqueidentifier] NOT NULL,
	[SystemUserId] [uniqueidentifier] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_UserCompany] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [uniqueidentifier] NOT NULL,
	[SystemUserId] [uniqueidentifier] NOT NULL,
	[SystemRoleId] [int] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tstamp] [datetime] NULL,
	[IsSync] [bit] NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202108122348350_InitialCreate', N'ideaXApi.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C596FE436127E5F20FF41D0D366E1B47C6406B3467702A76D27C68E0F4C7B82BC0DD812BB2D8C442912E5D858E497EDC3FEA4FD0B5BD4D5E22551DDEAC3C100839658FCEA60912C968AFEDF7FFE3BFEF1250CAC679CA47E4426F6C9E8D8B6307123CF27CB899DD1C5771FEC1F7FF8E66FE32B2F7CB17EADE8CE181DF424E9C47EA2343E779CD47DC2214A47A1EF26511A2DE8C88D42077991737A7CFC4FE7E4C4C100610396658D3F6584FA21CE1FE0711A1117C73443C16DE4E1202DDF43CB2C47B5EE5088D318B97862FB1E46BF5DC4FEA820B5AD8BC04720C60C070BDB428444145110F2FC738A673489C87216C30B143CBEC618E81628487129FCF98ADC548FE353A687B3EA5841B9594AA3B027E0C959691847ECBE9679EDDA7060BA2B30317D655AE7E69BD8371ECE5F7D8A023080C8F07C1A248C7862DFD62C2ED2F80ED351D57154405E2700F747947C1D35118F2CE37E47B5239D8E8ED9BF236B9A05344BF084E08C262838B21EB279E0BBFFC2AF8FD1574C266727F3C5D98777EF9177F6FE7B7CF6AEA929E80A74DC0B78F59044314E4036BCA8F5B72D87EFE7881DEB6E8D3E8555C097604ED8D62D7AF988C9923EC16C39FD605BD7FE0BF6AA37A5737D263E4C21E844930C1EEFB22040F300D7ED4E2B4FF67F0BD7D377EF07E17A879EFD653EF4027F983809CCAB4F38C85BD3273F2EA61737DE5F4AB2EB240AD933EF5F45EB975994252E5326D2923CA26489292FDDD85939AF914B33A8E1DDBA423D7CD76692CAEEAD24650AAD33132A16BB9E0D95BCDBE56BEC7117710C8397BB16B3489BC3093BD548E87A6455042BA73931751A02CAFC95D740B03B4EE2C44F1B637F43E8D9696FA49B7496C173315805D04F11F81422432FCCF0D3C8141D9A87C80F0658FE0DB840D8B5F093107B9B1AE601A529AC7EDE2F287DDABA8166D8CD129894338AC278EBDC1E9E2282EFB270BE729F5DF01A6C681EFF88AE914BA3E48AB05E1BE37D8CDCAF5146AF88778928FE4CDD0A903D3EFAA139C020E25CB82E4ED36B7066EC4D2338556CB658B05562DFE1D734407EA88EBF841DE44B45BA8AC1D414521CA62153C5626DA27E8C963E3113B522D58B5A50748A5A92F515958199495A52EA05CD093AE52CA8068B6EF3111A3EBCCD610F3FBEDD2C6CD1AD050D33CE6085C43F63821358C6BC074421FC20AB11305937F61126E5C3C7986E7D6FCA39FD8A826C68566BCD867C11187E36E4B0873F1B7231E1F5331C2012A3435F450CF046F4EAF364F79C1324DBF574E0D4DC35F3DDAC01BAE97291A691EBE7B34091EE2B9335BCFC10C359DD999B421B31FB038A81A3FB6CCB8337A09B2D3AD53DB9C401A6D8BA708B74E814A52EF2643382425E0FC1AA1D5521D82A0BC40BF70F8927783A4E5827C40E4129CC549F50795AF8C4F56314745A49E869B88531DD6B1E62CB258E31610C3B2D61C25C9DF46102D47C8441E9B2D0D869785CBB236AA256DD987785B0AB719772313BF1C98ED859E39765FCB615C76CB7D80E9CB3DD242602681398FB70D0F2AC62EA00E2C1E5D01C543831691CB40CA976E2A0BCC5F6E0A0BC49DE9C83164754D3F117CEAB87E69EFC4179F7DB7AABB9F6E09B9C3D0ECC358BD813FA50E88113D93D2FE7AC11BF50C5E10CE42CCF676919EA8A2EC2C06798F2299B55BCAB8C439D7610D189DA00578ED6015A7EFA9480A409D543B82A97D72A5D1945F480ADF26EADB0E5DA2FC0367C40C66E7E026E10EA3F148BCE6974FAA835ABBD417272A3C3420347E110E2E2C52B6E60145D5E56368C492CDC271A6E28560E468B813A22578D912A6506B752E59ADD565205647D42B28DAC24844F1A2B55CA0C6EA5D247BB8DA4080A7A84051B9988DFC2079A6C55A6A3DE6DEAB6B1539485952FC68EA67E6C7C8BE2D827CB463D59F9C69A15C564D3EF66FD0BADC202C3715345BD552D6DCD8946095A62A1155883A4D77E92D24B44D11CB13CCFD40B2532E5DEAA59FE2B96CDED531EC46A1FA8A8D9EFA28758B0C06DB4722452025C837A210B67F21CBA62F0D5DD2D56DC87029428D2F6D328C842A28FAEF4BD8B8F77CDFEC51B1961EC08F24BD193642A29C6E5ED6E342AF28C186284EAC865FD51D243E86C5DC59D4D6BEB62513D4A959A6AA2E8D2557B1B355D08633E526268D87FA03A11B633A3F84A9C260EDF628EC855E47082351BB631E7B53A1635379C72C5AB9E188DB20D09ACD1668ECA57D63431F9167344A17CA6092934F590B25924C309D96C580B4F635135853907B92CA6892EB79A232B0A649AD08AE635B015328B6DE6A88A1A9A26B0A2D91C7B555023EE1207BC2F6B0F65EB6DCCC5A17DB39D5983B19D257F988DBD519BD0046ABCEE8955561F4860E5FB837425EDC9753D572A12359BB9920643BFE6709FF4F925A7B50E418FC97DA7E796F5B63A053D5E3F87DDAA5B48A75691A4E65E9F5E8553EAB83C31765F85928E9005896D5566842DFD35A5381C3182D1ECF7601AF8982DE015C12D22FE02A7B4A84DB14F8F4F4E850B558773B9C949532F509CB875379CF831DB419919794689FB8412B9E863833AF315A8944FBF211E7E99D8FFCE7B9DE7A919F62B7F7D64DDA49F89FF7B060D8F4986AD3FE522D6612E44185CC1A905FDF34DDC6D3137F9CD6F5F8AAE47D67D02D3E9DC3A160CBDCEF0F3375E7A495374DD409AB5EFC1BCDDD976A5B86AE2B34572F38B2673BF3F8C6AF2FF3D442FDF36917A5F24515A4B5805D6BF37B28E9EAA3B231BE9ABBC17B211A2E2EEC7507883985077B7631D2CEDBD0E0F1E697EAFA39FB2EA7B1EEB88A6BDE3B1CE2C156F78982FAF55CF3DEEAF8A53E02E96DADCCE9D15F21B95CBEE7BCF950AE9379AE872B17C0FB8410BE2370BBDDE58A1F9602181A28E7C30EC7DFAFDD68BC70FA55E7C7518D96F99F82E2BC35BBE01FEA50AC20FA084515192B5FFB2EF5DFB9A2EAD7DE0B5B3FD8ABB0FCCD9CA6D7EFF25DCBB76365DE2FBC09DAD57A1F681F9DABEF6CF3D7B9AF116BAF7B26BB9824CF3794A951DEF2AAB2E3E25C0F17F1E8113141165711B565DC7D75683DCC17045A267AA2F2014194B1347E22B51B4B3EDA76BB9E1B72A5BD2B4B3D594DDB6F12ED7FF56DE254D3B6F4D31EB3E0AC295E5A4AA22FD8E75ACADE2ED2D1580739A74DC37E88A595B6B0DDE52BDF72046E1668FE6ABF9DB29EF1EC424434E9D1EE5DCF20770D83B1B7F3114F6EFD45FAE20D8DF0F25D8E576CD9AE6862CA26AF31624AA48840CCD2DA6C8832DF522A1FE02B9149A59023ABFCE9F27F5D8679039F66EC87D46E38C82CA389C075CC28B05016DFCF39A755EE6F17DCC9ED2215400317D96B8BF273F657EE0D5725F2B72421A08165D94E95E369694A57D97AF35D25D440C814AF3D541D1230EE300C0D27B3243CF781DD9C0FD3EE225725F5719401D48F740F0661F5FFA6899A0302D3156FDE1117CD80B5F7EF83FA09C0C3B38570000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[AppMainMenu] ON 

INSERT [dbo].[AppMainMenu] ([Id], [EnterpriseId], [Description], [Icon], [SeqNo], [IsActive], [IsSync]) VALUES (1, 1, N'Dashboard', N'fa fa-th-large', 1, 1, 1)
INSERT [dbo].[AppMainMenu] ([Id], [EnterpriseId], [Description], [Icon], [SeqNo], [IsActive], [IsSync]) VALUES (2, 1, N'Company Details', N'fas fa-landmark', 2, 1, 1)
INSERT [dbo].[AppMainMenu] ([Id], [EnterpriseId], [Description], [Icon], [SeqNo], [IsActive], [IsSync]) VALUES (3, 1, N'Users', N'fa fa-user', 3, 1, 1)
INSERT [dbo].[AppMainMenu] ([Id], [EnterpriseId], [Description], [Icon], [SeqNo], [IsActive], [IsSync]) VALUES (4, 1, N'Master Data', N'fa fa-briefcase', 4, 1, 1)
INSERT [dbo].[AppMainMenu] ([Id], [EnterpriseId], [Description], [Icon], [SeqNo], [IsActive], [IsSync]) VALUES (5, 1, N'Personal Information', N'fa fa-folder', 5, 1, 1)
INSERT [dbo].[AppMainMenu] ([Id], [EnterpriseId], [Description], [Icon], [SeqNo], [IsActive], [IsSync]) VALUES (6, 1, N'Products', N'fa fa-cubes', 6, 1, 1)
SET IDENTITY_INSERT [dbo].[AppMainMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[AppSubMenu] ON 

INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (1, 1, N'Dashboard 1', N'', 1, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (2, 1, N'Dashboard 2', N'/dashboards/dashboard2', 2, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (3, 1, N'Dashboard 3', N'/dashboards/dashboard3', 3, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (4, 1, N'Dashboard 4', N'/dashboards/dashboard4', 4, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (5, 1, N'Dashboard 5', N'/dashboards/dashboard5', 5, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (6, 2, N'Company', N'/company', 1, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (7, 2, N'Branch', N'/branch', 2, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (8, 3, N'Users', N'/user', 1, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (9, 3, N'Roles', N'/role', 2, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (10, 2, N'Distributor', N'/distributor', 4, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (11, 2, N'Payment Type', N'/paymenttype', 5, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (12, 6, N'Product Group', N'product/Group', 1, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (13, 6, N'Product Subgroup', N'product/Subgroup', 2, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (14, 6, N'Supplier', N'/product/Supplier', 3, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (15, 2, N'Warehouse', N'/warehouse', 3, 1, 1)
INSERT [dbo].[AppSubMenu] ([Id], [MainMenuId], [Description], [URL], [SeqNo], [IsActive], [IsSync]) VALUES (16, 6, N'Product', N'/product', 4, 1, 1)
SET IDENTITY_INSERT [dbo].[AppSubMenu] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [EnterpriseId], [IsSuperUser], [Name], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1bd55323-5a55-4261-8dc8-1c9f4923e490', 1, 0, N'Sweet', NULL, 0, N'AC/5PqgyEudEnvU+OAPu4OEcZ73UmMG1DCkcHaeASEecijmuhYjd7rEl1rTxkY9HJA==', N'c71e077e-1509-48f8-af9d-439c01cff4d1', NULL, 0, 0, NULL, 0, 0, N'Alert')
INSERT [dbo].[AspNetUsers] ([Id], [EnterpriseId], [IsSuperUser], [Name], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'37f21fe7-e9c4-4d85-bb7c-87d335967168', 1, 0, N'System Admin', NULL, 0, N'ALDqhxfuv5bvV7//ScR4i7zkWbX1IHlNdtE8ayJsXNgfK3bW/+uHkW+B9rncdt6qlA==', N'be48b2e4-41b4-4106-ad48-02a83708b9c9', NULL, 0, 0, NULL, 0, 0, N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [EnterpriseId], [IsSuperUser], [Name], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3b08099e-967a-475b-938c-71159d5e6789', 1, 0, N'Json', NULL, 0, N'ALh6PBPL9D73031+fN2raLL/9dRGLC/XHsYOwCryrTksnB1TBxRGHbvXawDPGzHfag==', N'e1fc2a58-dab2-49f2-95d0-1d31d198fc84', NULL, 0, 0, NULL, 0, 0, N'Companu')
INSERT [dbo].[AspNetUsers] ([Id], [EnterpriseId], [IsSuperUser], [Name], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bac020be-7355-467b-95a4-3eba8fe8e69b', 1, 0, N'Delta', NULL, 0, N'ALtSAdCygY88wo3hVMPSPpUcdmVzkrAjHJXOVDAM3lVzXch2PXJeCjHQD6to0sVs8g==', N'0bb3873b-6517-4f95-bf64-6c48f4f703f9', NULL, 0, 0, NULL, 0, 0, N'Bulto')
INSERT [dbo].[AspNetUsers] ([Id], [EnterpriseId], [IsSuperUser], [Name], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 1, 0, N'Ashfan', NULL, 0, N'ALwJKQpvuzQ7+MrmDWtitYitBHZDP5NA5MMzYEuZ9hP1JazZD14QOD/5NMVaOCrwmA==', N'91c329d3-2e32-4423-b6fa-0c6e08915399', NULL, 0, 0, NULL, 0, 0, N'Ashfan')
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (5, 122, N'Test1', N'First Branch1', 1, 0, CAST(N'2021-08-26T23:11:52.873' AS DateTime), 0)
INSERT [dbo].[Branch] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (6, 127, N'Pfizar', N'Corona', 1, 0, CAST(N'2021-08-26T23:51:56.377' AS DateTime), 0)
INSERT [dbo].[Branch] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (7, 127, N'Nazx', N'xzaZ', 0, 0, CAST(N'2021-08-27T00:07:27.163' AS DateTime), 0)
INSERT [dbo].[Branch] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (9, 130, N'Color', N'', 1, 0, CAST(N'2021-09-21T17:35:04.783' AS DateTime), 0)
INSERT [dbo].[Branch] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (10, 127, N'Header', N'', 1, 0, CAST(N'2021-09-22T13:15:14.983' AS DateTime), 0)
INSERT [dbo].[Branch] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (11, 130, N'bbbbb', N'', 1, 0, CAST(N'2021-09-22T13:15:30.303' AS DateTime), 0)
INSERT [dbo].[Branch] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (12, 130, N'sdsdsd', N'', 1, 0, CAST(N'2021-09-22T13:26:52.677' AS DateTime), 0)
INSERT [dbo].[Branch] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (13, 130, N'onChange', N'', 1, 0, CAST(N'2021-09-22T14:42:34.930' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Branch] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientType] ON 

INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (1, 117, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (2, 128, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (3, 118, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (4, 130, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (5, 119, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (6, 138, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (7, 120, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (8, 122, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (9, 123, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (10, 124, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (11, 126, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (12, 127, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (13, 137, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
INSERT [dbo].[ClientType] ([Id], [CompanyId], [Description], [Price], [IsActive], [Tstamp]) VALUES (14, 129, N'Distributor', N'DistributorPrice', 1, CAST(N'2021-09-26T02:23:43.887' AS DateTime))
SET IDENTITY_INSERT [dbo].[ClientType] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (117, 1, N'A', N'Description', 1, 0, CAST(N'2021-08-28T21:56:09.723' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (118, 1, N'B', N'ABC', 1, 0, CAST(N'2021-08-18T22:07:54.680' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (119, 1, N'C', N'', 0, 0, CAST(N'2021-08-19T13:10:52.790' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (120, 1, N'D', N'1234', 1, 0, CAST(N'2021-08-20T19:28:13.767' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (122, 1, N'ee', N'EEE', 0, 0, CAST(N'2021-09-21T02:29:46.700' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (123, 1, N'F', N'F', 1, 0, CAST(N'2021-08-18T22:13:43.240' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (124, 1, N'G', N'sdsdsdsd', 1, 0, CAST(N'2021-08-19T13:10:44.143' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (126, 1, N'H', N'HHHHHHHHHHH', 1, 0, CAST(N'2021-08-20T19:27:48.887' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (127, 1, N'Json Company', N'Json description', 1, 0, CAST(N'2021-08-26T18:23:22.990' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (128, 1, N'Active False', N'Active', 1, 0, CAST(N'2021-08-26T22:15:13.090' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (129, 1, N'Sweet alert', N'alert', 1, 0, CAST(N'2021-08-26T19:19:12.140' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (130, 1, N'bbbbbb', N'tttttt', 1, 0, CAST(N'2021-09-22T22:11:40.223' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (137, 1, N'Lorem Ipsum', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 0, CAST(N'2021-09-21T02:29:56.750' AS DateTime), 0)
INSERT [dbo].[Company] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (138, 1, N'Color admin', N'', 1, 0, CAST(N'2021-09-22T22:34:03.473' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Distributor] ON 

INSERT [dbo].[Distributor] ([Id], [EnterpriseId], [Name], [Description], [Address], [ContactNo], [Email], [DepositAmount], [PaymentTypeId], [CreditPeriod], [IsActive], [IsSuspect], [SuspectReason], [IsDelete], [Tstamp], [IsSync]) VALUES (1, 1, N'First distributor', N'Check', N'Salmiya,
Block 10,
Eisa al qatami,
Lane 2,
Building No 54
Floor 3
Room No 11', N'97270326', N'first@mail.com', CAST(1000.00 AS Decimal(18, 2)), 1, 2, 1, 0, NULL, 0, CAST(N'2021-08-29T20:08:12.797' AS DateTime), 0)
INSERT [dbo].[Distributor] ([Id], [EnterpriseId], [Name], [Description], [Address], [ContactNo], [Email], [DepositAmount], [PaymentTypeId], [CreditPeriod], [IsActive], [IsSuspect], [SuspectReason], [IsDelete], [Tstamp], [IsSync]) VALUES (2, 1, N'Jagath', N'Dummy', N'main street
kandy', N'789456', N'jaga@mail.com', CAST(2500.00 AS Decimal(18, 2)), 2, 2, 1, 1, N'Suspectr', 0, CAST(N'2021-09-21T21:42:18.427' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Distributor] OFF
GO
SET IDENTITY_INSERT [dbo].[Enterprise] ON 

INSERT [dbo].[Enterprise] ([Id], [Name], [DateRegistered], [DateApproved], [ReferredBy], [SubscriptionTypeId], [SubscriptionStartDate], [SubscriptionEndDate], [Description], [IsActive], [IsDeleted], [Tstamp]) VALUES (1, N'ideaX Test', CAST(N'2021-08-14T00:45:15.617' AS DateTime), CAST(N'2021-08-14T00:45:15.617' AS DateTime), NULL, 1, CAST(N'2021-08-14' AS Date), CAST(N'2021-08-15' AS Date), NULL, 1, 0, CAST(N'2021-08-14T00:45:15.617' AS DateTime))
INSERT [dbo].[Enterprise] ([Id], [Name], [DateRegistered], [DateApproved], [ReferredBy], [SubscriptionTypeId], [SubscriptionStartDate], [SubscriptionEndDate], [Description], [IsActive], [IsDeleted], [Tstamp]) VALUES (3, N'ideaX Test2', CAST(N'2021-08-14T00:45:15.617' AS DateTime), CAST(N'2021-08-14T00:45:15.617' AS DateTime), NULL, 1, CAST(N'2021-08-14' AS Date), CAST(N'2021-08-15' AS Date), NULL, 1, 0, CAST(N'2021-08-14T00:45:15.617' AS DateTime))
SET IDENTITY_INSERT [dbo].[Enterprise] OFF
GO
SET IDENTITY_INSERT [dbo].[MainMenu] ON 

INSERT [dbo].[MainMenu] ([Id], [EnterpriseId], [title], [icon], [caret], [SeqNo], [url], [IsActive], [IsSync]) VALUES (1, 1, N'Dashboard', N'fa fa-th-large', N'1', 1, NULL, 1, 1)
INSERT [dbo].[MainMenu] ([Id], [EnterpriseId], [title], [icon], [caret], [SeqNo], [url], [IsActive], [IsSync]) VALUES (2, 1, N'Company Details', N'fas fa-landmark', N'1', 2, NULL, 1, 1)
INSERT [dbo].[MainMenu] ([Id], [EnterpriseId], [title], [icon], [caret], [SeqNo], [url], [IsActive], [IsSync]) VALUES (3, 1, N'Users', N'fa fa-user', N'1', 3, NULL, 1, 1)
INSERT [dbo].[MainMenu] ([Id], [EnterpriseId], [title], [icon], [caret], [SeqNo], [url], [IsActive], [IsSync]) VALUES (4, 1, N'Master Data', N'fa fa-briefcase', N'1', 4, NULL, 1, 1)
INSERT [dbo].[MainMenu] ([Id], [EnterpriseId], [title], [icon], [caret], [SeqNo], [url], [IsActive], [IsSync]) VALUES (5, 1, N'Personal Information', N'fa fa-folder', N'1', 5, NULL, 1, 1)
INSERT [dbo].[MainMenu] ([Id], [EnterpriseId], [title], [icon], [caret], [SeqNo], [url], [IsActive], [IsSync]) VALUES (6, 1, N'Products', N'fa fa-cubes', N'1', 6, NULL, 1, 1)
INSERT [dbo].[MainMenu] ([Id], [EnterpriseId], [title], [icon], [caret], [SeqNo], [url], [IsActive], [IsSync]) VALUES (7, 1, N'Transaction', N'fas fa-truck', N'1', 7, NULL, 1, 1)
INSERT [dbo].[MainMenu] ([Id], [EnterpriseId], [title], [icon], [caret], [SeqNo], [url], [IsActive], [IsSync]) VALUES (8, 1, N'Inventory', N'fas fa-boxes', N'1', 8, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[MainMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[MasterProductAttribute] ON 

INSERT [dbo].[MasterProductAttribute] ([Id], [CompanyId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (1, 127, N'Size', NULL, 1, 0, CAST(N'2021-09-25T21:58:25.793' AS DateTime))
INSERT [dbo].[MasterProductAttribute] ([Id], [CompanyId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (2, 127, N'Colors', N'Color Description', 1, 0, CAST(N'2021-09-28T18:23:43.267' AS DateTime))
INSERT [dbo].[MasterProductAttribute] ([Id], [CompanyId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (3, 127, N'Weight', N'Product Weight', 1, 0, CAST(N'2021-09-25T18:41:44.750' AS DateTime))
INSERT [dbo].[MasterProductAttribute] ([Id], [CompanyId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (4, 130, N'B Sizes', N'B Size descriptin', 1, 0, CAST(N'2021-09-26T01:06:22.713' AS DateTime))
SET IDENTITY_INSERT [dbo].[MasterProductAttribute] OFF
GO
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'60fb5922-0923-4d6d-a7d7-0271c444da7f', 3, N'Pound', NULL, CAST(N'2021-09-28T20:23:58.863' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'f3749b4a-4bd3-4184-b8c8-1f0f364ba51c', 3, N'Gram', NULL, CAST(N'2021-09-28T20:23:58.863' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'32218ea0-7f27-4057-b213-1f8a3b7082f4', 3, N'Liter', NULL, CAST(N'2021-09-28T20:23:58.863' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'c7638e4f-d4ec-4d3f-aeab-25e4fdfded21', 2, N'Black', NULL, CAST(N'2021-09-24T20:45:16.587' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'2356aacb-8056-4bf4-9d32-2d0c80db8c67', 2, N'Brown', NULL, CAST(N'2021-09-25T19:04:12.787' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'c90b1a69-81ae-4473-b133-3271510514e3', 1, N'Medium', NULL, CAST(N'2021-09-28T20:34:12.523' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'dea3ba66-1820-4748-90e6-613b1bfdb618', 2, N'White', NULL, CAST(N'2021-09-25T17:37:00.383' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'c4a2db36-0e47-46a3-b03e-6ef57909d86d', 3, N'Ounce', NULL, CAST(N'2021-09-28T20:23:58.863' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'64fc63ec-b959-48fe-961e-735abd3ee69a', 2, N'Green', NULL, CAST(N'2021-09-25T01:48:27.880' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'1b1729aa-5581-4a86-8631-7f942923b8c1', 2, N'Pink', NULL, CAST(N'2021-09-25T17:39:34.697' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'66e9d403-983c-4e3e-952d-9902e5729617', 1, N'Large', NULL, CAST(N'2021-09-28T20:34:12.523' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'521140da-dfd5-44fd-95c0-bc7255911fb6', 2, N'Red', NULL, CAST(N'2021-09-25T19:07:05.250' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'e9015b35-d3df-454a-af33-cafe6cac0f67', 3, N'Milliliter ', NULL, CAST(N'2021-09-28T20:23:58.863' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'faf0c35b-daf8-4557-81a9-cf611da4f4f5', 3, N'Kilogram', NULL, CAST(N'2021-09-28T20:23:58.863' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'71691c6d-cdd1-47ed-8946-da1a41b95cc3', 3, N'123456', NULL, CAST(N'2021-09-28T20:23:58.863' AS DateTime))
INSERT [dbo].[MasterProductAttributeItem] ([Id], [MasterProductAttributeId], [Name], [Description], [Tstamp]) VALUES (N'c04bf424-c258-4cd4-9ac3-fc13ca500901', 1, N'Small', NULL, CAST(N'2021-09-28T20:34:12.523' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDelete], [IsSync], [Tstamp]) VALUES (1, 1, N'Cash', N'Cash', 1, 0, 0, CAST(N'2021-08-28T21:52:09.083' AS DateTime))
INSERT [dbo].[PaymentType] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDelete], [IsSync], [Tstamp]) VALUES (2, 1, N'Credit', N'Add Description', 1, 0, 0, CAST(N'2021-08-28T22:13:26.637' AS DateTime))
INSERT [dbo].[PaymentType] ([Id], [EnterpriseId], [Name], [Description], [IsActive], [IsDelete], [IsSync], [Tstamp]) VALUES (3, 1, N'Visa', N'', 0, 0, 0, CAST(N'2021-08-28T22:48:00.143' AS DateTime))
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ProductSubgroupId], [Name], [ProductSupplierId], [CostPrice], [MinimumPrice], [RetailPrice], [WholesalePrice], [DistributorPrice], [IsOpenPrice], [IsReturnable], [MonitorExpiry], [TrackInventory], [ROL], [ROQ], [Attribute], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (1, 1, N'First Product', 1, CAST(0.000 AS Decimal(18, 3)), CAST(6400.000 AS Decimal(18, 3)), CAST(6500.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, 1, 0, 1, CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, N'ccsvw
vwvwvw
WFF
fegeg
ge
ge
geg', 0, 0, CAST(N'2021-09-07T04:57:14.093' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductSubgroupId], [Name], [ProductSupplierId], [CostPrice], [MinimumPrice], [RetailPrice], [WholesalePrice], [DistributorPrice], [IsOpenPrice], [IsReturnable], [MonitorExpiry], [TrackInventory], [ROL], [ROQ], [Attribute], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (2, 1, N'Second Product', 1, CAST(0.000 AS Decimal(18, 3)), CAST(5.000 AS Decimal(18, 3)), CAST(50000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, 0, 0, 0, CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, N'', 0, 0, CAST(N'2021-09-07T05:48:47.077' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductSubgroupId], [Name], [ProductSupplierId], [CostPrice], [MinimumPrice], [RetailPrice], [WholesalePrice], [DistributorPrice], [IsOpenPrice], [IsReturnable], [MonitorExpiry], [TrackInventory], [ROL], [ROQ], [Attribute], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (3, 4, N'Jack and Johns', 2, CAST(0.000 AS Decimal(18, 3)), CAST(4999.000 AS Decimal(18, 3)), CAST(5000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, 1, 0, 1, CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, N'Nice shoes and socks used .
I have no idea
sdwfw
wfwfwg
ggw', 1, 0, CAST(N'2021-09-07T04:53:43.133' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductSubgroupId], [Name], [ProductSupplierId], [CostPrice], [MinimumPrice], [RetailPrice], [WholesalePrice], [DistributorPrice], [IsOpenPrice], [IsReturnable], [MonitorExpiry], [TrackInventory], [ROL], [ROQ], [Attribute], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (4, 2, N'Masala thul', 1, CAST(0.000 AS Decimal(18, 3)), CAST(235.000 AS Decimal(18, 3)), CAST(250.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, 0, 0, 0, CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, N'', 1, 0, CAST(N'2021-09-08T16:04:50.890' AS DateTime))
INSERT [dbo].[Product] ([Id], [ProductSubgroupId], [Name], [ProductSupplierId], [CostPrice], [MinimumPrice], [RetailPrice], [WholesalePrice], [DistributorPrice], [IsOpenPrice], [IsReturnable], [MonitorExpiry], [TrackInventory], [ROL], [ROQ], [Attribute], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (5, 1, N'Class change', 1, CAST(0.000 AS Decimal(18, 3)), CAST(3600.000 AS Decimal(18, 3)), CAST(500.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, 0, 1, 0, CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, N'sdswwdwdwdwdwdw', 1, 0, CAST(N'2021-09-30T00:17:51.670' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductGroup] ON 

INSERT [dbo].[ProductGroup] ([Id], [CompanyId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (1, 127, N'Fruit', N'All kind of fruits', 1, 0, CAST(N'2021-09-02T21:11:13.177' AS DateTime))
INSERT [dbo].[ProductGroup] ([Id], [CompanyId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (4, 130, N'Json compnay group', N'group description', 0, 0, CAST(N'2021-09-03T15:35:14.410' AS DateTime))
INSERT [dbo].[ProductGroup] ([Id], [CompanyId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (5, 129, N'Vegetable', N'asdrftgh', 1, 0, CAST(N'2021-09-23T23:59:23.097' AS DateTime))
INSERT [dbo].[ProductGroup] ([Id], [CompanyId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (6, 117, N'asasas', N'wdwfwfwfwfwfw', 1, 0, CAST(N'2021-09-23T23:59:55.670' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImge] ON 

INSERT [dbo].[ProductImge] ([Id], [ProductId], [Name], [ImagePath], [Tstamp]) VALUES (37, 2, N'11.jpg', N'/Images/Product/11.jpg', CAST(N'2021-09-07T05:34:24.380' AS DateTime))
INSERT [dbo].[ProductImge] ([Id], [ProductId], [Name], [ImagePath], [Tstamp]) VALUES (38, 2, N'12.jpg', N'/Images/Product/12.jpg', CAST(N'2021-09-07T05:34:24.683' AS DateTime))
INSERT [dbo].[ProductImge] ([Id], [ProductId], [Name], [ImagePath], [Tstamp]) VALUES (39, 2, N'13.jpg', N'/Images/Product/13.jpg', CAST(N'2021-09-07T05:34:24.737' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductImge] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSubGroup] ON 

INSERT [dbo].[ProductSubGroup] ([Id], [ProductGroupId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (1, 1, N'Jackson', N'Fruits supplier', 1, 0, CAST(N'2021-09-03T20:34:30.277' AS DateTime))
INSERT [dbo].[ProductSubGroup] ([Id], [ProductGroupId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (2, 4, N'Lets Check', N'dwdqdqwdqwd', 1, 0, CAST(N'2021-09-03T20:12:03.363' AS DateTime))
INSERT [dbo].[ProductSubGroup] ([Id], [ProductGroupId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (3, 5, N'qwqwqw', N'tthththq', 1, 0, CAST(N'2021-09-03T20:35:10.517' AS DateTime))
INSERT [dbo].[ProductSubGroup] ([Id], [ProductGroupId], [Name], [Description], [Active], [IsDeleted], [Tstamp]) VALUES (4, 4, N'Modal Chnanged', N'dwdwdwdw', 1, 0, CAST(N'2021-09-24T02:43:38.037' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductSubGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSupplier] ON 

INSERT [dbo].[ProductSupplier] ([Id], [CompanyId], [Name], [Description], [Address], [ContactNo], [Email], [Active], [IsDeleted], [Tstamp]) VALUES (1, 127, N'Jackson Supplier', N'Fruits supplier Updated', N'Depanama, 
Main street
Godagama', N'7777777777', N'fruits@jackson.com', 1, 0, CAST(N'2021-09-03T16:42:05.657' AS DateTime))
INSERT [dbo].[ProductSupplier] ([Id], [CompanyId], [Name], [Description], [Address], [ContactNo], [Email], [Active], [IsDeleted], [Tstamp]) VALUES (2, 129, N'Sweet Supplier', N'Description', N'Address', N'555333666', N'yapahuwa.sch@mail.com', 1, 0, CAST(N'2021-09-03T18:20:04.553' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductSupplier] OFF
GO
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'02d405b7-9439-429c-9433-025d8ba2ed19', 1, 8, 1, 1, 1, 1, CAST(N'2021-08-26T00:53:27.633' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'ea791c2f-5573-45bd-834f-0344c53606c3', 1, 10, 1, 1, 1, 1, CAST(N'2021-08-28T19:39:51.097' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'f197bd75-5d41-4f01-9dd4-0c3d1f02f171', 1, 5, 1, 1, 1, 1, CAST(N'2021-08-26T00:53:27.633' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'52d6448b-9412-4f9a-b302-252c499c546f', 1, 12, 1, 1, 1, 1, CAST(N'2021-09-02T19:35:40.813' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'c010cc5b-8ba7-403a-adeb-2ef585cdc9bb', 1, 11, 1, 1, 1, 1, CAST(N'2021-08-28T19:39:51.097' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'591d0e3c-bd03-4a30-96f7-3b9242dd0b36', 1, 15, 1, 1, 1, 1, CAST(N'2021-09-02T19:45:32.833' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'afa2e21a-3ff6-4745-8ad8-48c106d8c8ba', 1, 2, 1, 1, 1, 1, CAST(N'2021-08-26T00:53:27.633' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'eb7c4fd3-9920-42b8-a2ec-4b619d7815d5', 1, 14, 1, 1, 1, 1, CAST(N'2021-09-02T19:43:55.360' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'72de236c-a5bd-4d9d-82d4-73106071f458', 1, 1, 1, 0, 1, 1, CAST(N'2021-08-25T22:13:29.577' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'1681ee60-9085-483a-be64-74c62d463c37', 1, 7, 1, 1, 0, 1, CAST(N'2021-08-26T00:53:27.633' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'69e5e1ca-1470-46df-bfbb-aa6e7c54d135', 1, 4, 1, 1, 1, 0, CAST(N'2021-08-28T00:59:06.760' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'd11a7a6f-b4a0-4f9e-bf10-ace99e3cd319', 1, 3, 1, 1, 1, 1, CAST(N'2021-08-26T00:53:27.633' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'484a70c4-bc6d-4123-b026-ae314fe66bf2', 1, 9, 1, 1, 1, 1, CAST(N'2021-08-28T00:59:06.760' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'18f24971-edb0-49b0-87d1-b8380dcdd271', 1, 6, 1, 1, 1, 1, CAST(N'2021-08-26T00:53:27.633' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'3163b040-2b00-4cfb-8852-c390dbf2b859', 1, 16, 1, 1, 1, 1, CAST(N'2021-09-04T18:37:25.180' AS DateTime), 1)
INSERT [dbo].[RoleSubMenu] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'7bee9c0a-f51f-467a-82c4-e07d334ac43c', 1, 13, 1, 1, 1, 1, CAST(N'2021-09-02T19:40:12.920' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[SubMenu] ON 

INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (1, 1, N'Dashboard', N'/dashboard/v2', 1, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (6, 2, N'Company', N'/company', 1, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (7, 2, N'Branch', N'company/branch', 2, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (8, 3, N'Users', N'/user', 1, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (9, 3, N'Roles', N'/role', 2, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (10, 2, N'Distributor', N'company/distributor', 4, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (11, 2, N'Payment Type', N'company/paymentType', 5, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (12, 6, N'Product Group', N'product/Group', 2, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (13, 6, N'Product Subgroup', N'product/Subgroup', 3, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (14, 6, N'Supplier', N'/product/Supplier', 4, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (15, 2, N'Warehouse', N'company/warehouse', 3, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (16, 6, N'Product', N'/product', 5, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (17, 6, N'Product Attribute', N'product/productAttribute', 1, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (18, 7, N'Purchase Order', N'transactions/po', 1, 1, 1)
INSERT [dbo].[SubMenu] ([Id], [MainMenuId], [title], [url], [SeqNo], [IsActive], [IsSync]) VALUES (19, 7, N'Dispatch Goods', N'transactions/dispatch', 2, 1, 1)
SET IDENTITY_INSERT [dbo].[SubMenu] OFF
GO
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'02d405b7-9439-429c-9433-025d8ba2ed19', 1, 8, 1, 1, 1, 1, CAST(N'2021-08-26T00:53:27.633' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'ea791c2f-5573-45bd-834f-0344c53606c3', 1, 10, 1, 1, 1, 1, CAST(N'2021-08-28T19:39:51.097' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'85344f71-f5b8-4fa7-98f8-12a25f0335eb', 1, 18, 1, 1, 1, 1, CAST(N'2021-09-25T22:34:09.340' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'52d6448b-9412-4f9a-b302-252c499c546f', 1, 12, 1, 1, 1, 1, CAST(N'2021-09-02T19:35:40.813' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'c010cc5b-8ba7-403a-adeb-2ef585cdc9bb', 1, 11, 1, 1, 1, 1, CAST(N'2021-08-28T19:39:51.097' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'591d0e3c-bd03-4a30-96f7-3b9242dd0b36', 1, 15, 1, 1, 1, 1, CAST(N'2021-09-02T19:45:32.833' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'1cb88b76-578c-4d16-b523-3fab4285998d', 1, 17, 1, 1, 1, 1, CAST(N'2021-09-24T20:08:06.013' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'eb7c4fd3-9920-42b8-a2ec-4b619d7815d5', 1, 14, 1, 1, 1, 1, CAST(N'2021-09-02T19:43:55.360' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'd2569d19-a342-4d3d-8440-52ce50299d27', 1, 19, 1, 1, 1, 1, CAST(N'2021-09-25T22:34:09.340' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'72de236c-a5bd-4d9d-82d4-73106071f458', 1, 1, 1, 0, 1, 1, CAST(N'2021-08-25T22:13:29.577' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'1681ee60-9085-483a-be64-74c62d463c37', 1, 7, 1, 1, 0, 1, CAST(N'2021-08-26T00:53:27.633' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'484a70c4-bc6d-4123-b026-ae314fe66bf2', 1, 9, 1, 1, 1, 1, CAST(N'2021-08-28T00:59:06.760' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'18f24971-edb0-49b0-87d1-b8380dcdd271', 1, 6, 1, 1, 1, 1, CAST(N'2021-08-26T00:53:27.633' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'3163b040-2b00-4cfb-8852-c390dbf2b859', 1, 16, 1, 1, 1, 1, CAST(N'2021-09-04T18:37:25.180' AS DateTime), 1)
INSERT [dbo].[SubMenuRole] ([Id], [SystemRoleId], [AppSubMenuId], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [Tstamp], [IsSync]) VALUES (N'7bee9c0a-f51f-467a-82c4-e07d334ac43c', 1, 13, 1, 1, 1, 1, CAST(N'2021-09-02T19:40:12.920' AS DateTime), 1)
GO
INSERT [dbo].[Suspend] ([Id], [SystemUserId], [EntityType], [EntityId], [Status], [Reason], [Tstamp]) VALUES (N'a86a26f1-6ca8-4cba-a2c5-43fc0bf72772', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', N'Distributor', 1, N'S', N'Suspect reason null', CAST(N'2021-08-29T20:07:59.197' AS DateTime))
INSERT [dbo].[Suspend] ([Id], [SystemUserId], [EntityType], [EntityId], [Status], [Reason], [Tstamp]) VALUES (N'd21e8298-0349-4410-a196-866ae7ef5e28', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', N'Distributor', 1, N'U', NULL, CAST(N'2021-08-29T20:05:15.880' AS DateTime))
INSERT [dbo].[Suspend] ([Id], [SystemUserId], [EntityType], [EntityId], [Status], [Reason], [Tstamp]) VALUES (N'2fef6a28-043b-493d-a386-b0be5f715c9b', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', N'Distributor', 2, N'S', N'Suspectr', CAST(N'2021-09-21T21:42:18.320' AS DateTime))
INSERT [dbo].[Suspend] ([Id], [SystemUserId], [EntityType], [EntityId], [Status], [Reason], [Tstamp]) VALUES (N'11f7654e-a2df-4591-8d51-c8ace27aa93a', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', N'Distributor', 1, N'S', N'Bang bang', CAST(N'2021-08-29T19:44:20.047' AS DateTime))
INSERT [dbo].[Suspend] ([Id], [SystemUserId], [EntityType], [EntityId], [Status], [Reason], [Tstamp]) VALUES (N'94f90330-a7fa-4e49-aab5-d7b665e761ab', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', N'Distributor', 1, N'U', NULL, CAST(N'2021-08-29T20:08:12.750' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[SystemRole] ON 

INSERT [dbo].[SystemRole] ([Id], [CompanyId], [Name], [Description], [Tstamp], [IsSync]) VALUES (1, 117, N'Admin', N'Administrator', CAST(N'2021-08-25T22:11:07.263' AS DateTime), 1)
INSERT [dbo].[SystemRole] ([Id], [CompanyId], [Name], [Description], [Tstamp], [IsSync]) VALUES (2, 117, N'Cashier', NULL, CAST(N'2021-08-28T01:17:35.663' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[SystemRole] OFF
GO
INSERT [dbo].[SystemUser] ([Id], [EnterpriseId], [Name], [UserName], [IsActive], [IsLockedOut], [IsSuperUser], [Tstamp], [IsSync]) VALUES (N'1bd55323-5a55-4261-8dc8-1c9f4923e490', 1, N'Sweet Alert', N'Alert', 1, 0, 0, NULL, 0)
INSERT [dbo].[SystemUser] ([Id], [EnterpriseId], [Name], [UserName], [IsActive], [IsLockedOut], [IsSuperUser], [Tstamp], [IsSync]) VALUES (N'bac020be-7355-467b-95a4-3eba8fe8e69b', 1, N'Delta', N'Bulto', 0, 0, 0, CAST(N'2021-08-27T20:22:39.890' AS DateTime), 0)
INSERT [dbo].[SystemUser] ([Id], [EnterpriseId], [Name], [UserName], [IsActive], [IsLockedOut], [IsSuperUser], [Tstamp], [IsSync]) VALUES (N'3b08099e-967a-475b-938c-71159d5e6789', 1, N'Json', N'Companu', 0, 0, 0, CAST(N'2021-08-27T19:27:44.137' AS DateTime), 0)
INSERT [dbo].[SystemUser] ([Id], [EnterpriseId], [Name], [UserName], [IsActive], [IsLockedOut], [IsSuperUser], [Tstamp], [IsSync]) VALUES (N'37f21fe7-e9c4-4d85-bb7c-87d335967168', 1, N'System Admin', N'admin', 1, 0, 0, CAST(N'2021-08-14T01:41:07.053' AS DateTime), 1)
INSERT [dbo].[SystemUser] ([Id], [EnterpriseId], [Name], [UserName], [IsActive], [IsLockedOut], [IsSuperUser], [Tstamp], [IsSync]) VALUES (N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 1, N'Ashfan', N'Ashfan', 1, 0, 0, CAST(N'2021-08-25T23:30:06.020' AS DateTime), 0)
GO
INSERT [dbo].[UserBranch] ([Id], [SystemUserId], [BranchId], [Tstamp], [IsSync]) VALUES (N'f58bc599-056f-4234-a30d-2cd347e67d83', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 5, CAST(N'2021-08-26T21:59:43.953' AS DateTime), 0)
INSERT [dbo].[UserBranch] ([Id], [SystemUserId], [BranchId], [Tstamp], [IsSync]) VALUES (N'cb2b324b-1ee6-4bfc-bbc2-36c6f88f68fb', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 11, CAST(N'2021-09-22T13:15:30.350' AS DateTime), 0)
INSERT [dbo].[UserBranch] ([Id], [SystemUserId], [BranchId], [Tstamp], [IsSync]) VALUES (N'850ba042-01ea-478f-914c-62ea60dd57b6', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 7, CAST(N'2021-08-27T00:07:27.240' AS DateTime), 0)
INSERT [dbo].[UserBranch] ([Id], [SystemUserId], [BranchId], [Tstamp], [IsSync]) VALUES (N'8a9e4f58-d864-47eb-aec8-72f661cd9744', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 9, CAST(N'2021-09-21T17:35:05.033' AS DateTime), 0)
INSERT [dbo].[UserBranch] ([Id], [SystemUserId], [BranchId], [Tstamp], [IsSync]) VALUES (N'3e8eef33-fd18-4f3f-96b8-93aac8ad04c2', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 10, CAST(N'2021-09-22T13:15:16.123' AS DateTime), 0)
INSERT [dbo].[UserBranch] ([Id], [SystemUserId], [BranchId], [Tstamp], [IsSync]) VALUES (N'900ee1fa-b695-4fe1-b8e9-b2e8bd575353', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 13, CAST(N'2021-09-22T14:42:35.420' AS DateTime), 0)
INSERT [dbo].[UserBranch] ([Id], [SystemUserId], [BranchId], [Tstamp], [IsSync]) VALUES (N'6da92d61-195b-4b3a-a8c3-dbf8bc75cfe2', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 12, CAST(N'2021-09-22T13:26:52.767' AS DateTime), 0)
INSERT [dbo].[UserBranch] ([Id], [SystemUserId], [BranchId], [Tstamp], [IsSync]) VALUES (N'd4a0ccfc-9c23-4966-b164-fc87a110caa4', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 6, CAST(N'2021-08-26T23:51:56.807' AS DateTime), 0)
GO
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'3c71e07a-2070-4259-87d0-2cace5fcee84', N'bac020be-7355-467b-95a4-3eba8fe8e69b', 127, CAST(N'2021-08-27T20:22:39.890' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'2fdb0201-7037-4d89-8a8b-5ad63d8a6cb0', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 127, CAST(N'2021-08-26T18:23:23.730' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'bbb5ad85-5338-497a-b545-796666677e90', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 130, CAST(N'2021-08-26T20:11:42.683' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'383280fb-14ce-45a3-900c-7be910529765', N'37f21fe7-e9c4-4d85-bb7c-87d335967168', 122, CAST(N'2021-08-18T22:13:22.140' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'bbbee8a9-0716-4211-a996-a3e4e346b269', N'1bd55323-5a55-4261-8dc8-1c9f4923e490', 129, CAST(N'2021-08-27T19:42:44.790' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'd3eb56c0-1601-4953-8521-af2b46b84944', N'37f21fe7-e9c4-4d85-bb7c-87d335967168', 117, CAST(N'2021-08-18T22:02:24.497' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'0cc4b18a-268c-40e3-95fd-b558fd636862', N'37f21fe7-e9c4-4d85-bb7c-87d335967168', 120, CAST(N'2021-08-18T22:07:04.650' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'afb666b4-3062-40c8-9841-bca4f20a0e1a', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 137, CAST(N'2021-08-26T23:54:03.640' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'4afa0663-e6c4-4850-8070-be174221929e', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 128, CAST(N'2021-08-26T18:30:11.857' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'92791b8a-cbe8-4eb1-822b-c3bc6f7c1cb8', N'37f21fe7-e9c4-4d85-bb7c-87d335967168', 119, CAST(N'2021-08-18T22:06:50.563' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'27f6de55-1713-4e80-81e1-d01e607023d2', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 129, CAST(N'2021-08-26T19:19:12.303' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'3ae699a2-2e3e-4e29-8ebe-dc6b967bc39a', N'37f21fe7-e9c4-4d85-bb7c-87d335967168', 123, CAST(N'2021-08-18T22:13:27.630' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'066039c9-321e-493e-9ea7-df45b6f5303a', N'37f21fe7-e9c4-4d85-bb7c-87d335967168', 124, CAST(N'2021-08-19T13:10:44.657' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'1d0225a4-6b1d-47a8-baea-ea4b4fbac1b7', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 138, CAST(N'2021-09-21T16:21:08.733' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'6f007113-33fa-4366-9e58-eb322a90650e', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 122, CAST(N'2021-08-26T14:58:43.733' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'382fd5ef-276b-4e5a-b126-f012636954d5', N'37f21fe7-e9c4-4d85-bb7c-87d335967168', 118, CAST(N'2021-08-18T22:06:29.367' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'e7c441cd-5779-4d1b-9e94-f0db1ec96f8d', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 117, CAST(N'2021-08-28T01:04:50.783' AS DateTime), 0)
INSERT [dbo].[UserCompany] ([Id], [SystemUserId], [CompanyId], [Tstamp], [IsSync]) VALUES (N'4aacc1b9-07e6-470b-9b8b-f86d3ee0a414', N'37f21fe7-e9c4-4d85-bb7c-87d335967168', 126, CAST(N'2021-08-20T19:27:53.367' AS DateTime), 0)
GO
INSERT [dbo].[UserRole] ([Id], [SystemUserId], [SystemRoleId], [Tstamp], [IsSync]) VALUES (N'c51bc5de-37f9-4e31-b3e8-b04fe1a3f448', N'fdccad98-7ae9-4393-a7ee-c1fdb8ccb24f', 1, CAST(N'2021-08-25T22:30:35.747' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Warehouse] ON 

INSERT [dbo].[Warehouse] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (5, 127, N'Warehouse', N'sdwsdwdwd', 1, 0, CAST(N'2021-09-22T21:24:15.330' AS DateTime), 0)
INSERT [dbo].[Warehouse] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (6, 129, N'Test Warehouse', N'Creepy', 0, 0, CAST(N'2021-09-04T00:53:49.517' AS DateTime), 0)
INSERT [dbo].[Warehouse] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (7, 127, N'Nazx', N'xzaZ', 0, 0, CAST(N'2021-08-27T00:07:27.163' AS DateTime), 0)
INSERT [dbo].[Warehouse] ([Id], [CompanyId], [Name], [Description], [IsActive], [IsDeleted], [Tstamp], [IsSync]) VALUES (8, 128, N'Active Badge', N'Check Badge', 1, 0, CAST(N'2021-09-04T00:53:58.677' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Warehouse] OFF
GO
ALTER TABLE [dbo].[AppMainMenu] ADD  CONSTRAINT [DF_AppMainMenu_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AppMainMenu] ADD  CONSTRAINT [defval_AppMainMenu]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[AppSubMenu] ADD  CONSTRAINT [DF_AppSubMenu_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AppSubMenu] ADD  CONSTRAINT [defval_AppSubMenu]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [DF_Branch_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [DF_Branch_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [DF_Branch_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [defval_Branch]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[ClientType] ADD  CONSTRAINT [DF_VendorType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ClientType] ADD  CONSTRAINT [DF_VendorType_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF_Company_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF_Company_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [defval_Company]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[DispatchOrder] ADD  CONSTRAINT [DF_DispatchOrder_DatePrepared]  DEFAULT (getdate()) FOR [DatePrepared]
GO
ALTER TABLE [dbo].[DispatchOrder] ADD  CONSTRAINT [DF_DispatchOrder_CostValue]  DEFAULT ((0)) FOR [CostValue]
GO
ALTER TABLE [dbo].[DispatchOrder] ADD  CONSTRAINT [DF_DispatchOrder_WholesaleValue]  DEFAULT ((0)) FOR [WholesaleValue]
GO
ALTER TABLE [dbo].[DispatchOrder] ADD  CONSTRAINT [DF_DispatchOrder_RetailValue]  DEFAULT ((0)) FOR [RetailValue]
GO
ALTER TABLE [dbo].[DispatchOrder] ADD  CONSTRAINT [DF_DispatchOrder_DistributorValue]  DEFAULT ((0)) FOR [DistributorValue]
GO
ALTER TABLE [dbo].[DispatchOrder] ADD  CONSTRAINT [DF_DispatchOrder_DiscountPercentage]  DEFAULT ((0)) FOR [DiscountPercentage]
GO
ALTER TABLE [dbo].[DispatchOrder] ADD  CONSTRAINT [DF_DispatchOrder_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[DispatchOrder] ADD  CONSTRAINT [DF_DispatchOrder_ReturnedAmount]  DEFAULT ((0)) FOR [ReturnedAmount]
GO
ALTER TABLE [dbo].[DispatchOrder] ADD  CONSTRAINT [DF_DispatchOrder_NetAmount]  DEFAULT ((0)) FOR [NetAmount]
GO
ALTER TABLE [dbo].[DispatchOrder] ADD  CONSTRAINT [DF_DispatchOrder_Status]  DEFAULT ('N') FOR [Status]
GO
ALTER TABLE [dbo].[DispatchOrder] ADD  CONSTRAINT [DF_DispatchOrder_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[Distributor] ADD  CONSTRAINT [DF_Distributor_DepositAmount]  DEFAULT ((0)) FOR [DepositAmount]
GO
ALTER TABLE [dbo].[Distributor] ADD  CONSTRAINT [DF_Distributor_CreditPeriod]  DEFAULT ((0)) FOR [CreditPeriod]
GO
ALTER TABLE [dbo].[Distributor] ADD  CONSTRAINT [DF_Distributor_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Distributor] ADD  CONSTRAINT [DF_Distributor_IsSuspect]  DEFAULT ((0)) FOR [IsSuspect]
GO
ALTER TABLE [dbo].[Distributor] ADD  CONSTRAINT [DF_Distributor_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Distributor] ADD  CONSTRAINT [DF_Distributor_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[Distributor] ADD  CONSTRAINT [DF_Distributor_IsSync]  DEFAULT ((0)) FOR [IsSync]
GO
ALTER TABLE [dbo].[Enterprise] ADD  CONSTRAINT [DF_Enterprise_DateRegistered]  DEFAULT (getdate()) FOR [DateRegistered]
GO
ALTER TABLE [dbo].[Enterprise] ADD  CONSTRAINT [DF_Enterprise_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Enterprise] ADD  CONSTRAINT [DF_Enterprise_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Enterprise] ADD  CONSTRAINT [DF_Enterprise_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[MasterAllowanceType] ADD  CONSTRAINT [defval_MasterAllowanceType]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[MasterEmployeeType] ADD  CONSTRAINT [DF_MasterEmployeeType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MasterEmployeeType] ADD  CONSTRAINT [DF_MasterEmployeeType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MasterEmployeeType] ADD  CONSTRAINT [DF_MasterEmployeeType_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[MasterEmployeeType] ADD  CONSTRAINT [defval_MasterEmployeeType]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[MasterGender] ADD  CONSTRAINT [DF_MasterGender_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MasterGender] ADD  CONSTRAINT [DF_MasterGender_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MasterGender] ADD  CONSTRAINT [DF_MasterGender_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[MasterGender] ADD  CONSTRAINT [defval_MasterGender]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[MasterLeaveType] ADD  CONSTRAINT [DF_MasterLeaveType_NoDays]  DEFAULT ((0)) FOR [NoDays]
GO
ALTER TABLE [dbo].[MasterLeaveType] ADD  CONSTRAINT [defval_MasterLeaveType]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[MasterLoanType] ADD  CONSTRAINT [DF_MasterLoanType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MasterLoanType] ADD  CONSTRAINT [DF_MasterLoanType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MasterLoanType] ADD  CONSTRAINT [DF_MasterLoanType_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[MasterLoanType] ADD  CONSTRAINT [defval_MasterLoanType]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[MasterOverTimeType] ADD  CONSTRAINT [DF_MasterOverTimeType_Rate]  DEFAULT ((0)) FOR [Rate]
GO
ALTER TABLE [dbo].[MasterOverTimeType] ADD  CONSTRAINT [defval_MasterOverTimeType]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[MasterProductAttribute] ADD  CONSTRAINT [DF_MasterProductAttribute_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[MasterProductAttribute] ADD  CONSTRAINT [DF_MasterProductAttribute_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MasterProductAttribute] ADD  CONSTRAINT [DF_MasterProductAttribute_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[MasterProductAttributeItem] ADD  CONSTRAINT [DF_MasterProductAttributeItem_NId]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[MasterProductAttributeItem] ADD  CONSTRAINT [DF_MasterProductAttributeItem_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[MasterSalaryType] ADD  CONSTRAINT [DF_MasterSalaryType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MasterSalaryType] ADD  CONSTRAINT [DF_MasterSalaryType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MasterSalaryType] ADD  CONSTRAINT [DF_MasterSalaryType_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[MasterSalaryType] ADD  CONSTRAINT [defval_MasterSalaryType]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[MasterTerminationType] ADD  CONSTRAINT [DF_MasterTerminationType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MasterTerminationType] ADD  CONSTRAINT [DF_MasterTerminationType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MasterTerminationType] ADD  CONSTRAINT [DF_MasterTerminationType_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[MasterTerminationType] ADD  CONSTRAINT [defval_MasterTerminationType]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_DatePrepared]  DEFAULT (getdate()) FOR [DatePrepared]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_CostValue]  DEFAULT ((0)) FOR [CostValue]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_WholesaleValue]  DEFAULT ((0)) FOR [WholesaleValue]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_RetailValue]  DEFAULT ((0)) FOR [RetailValue]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_DistributorValue]  DEFAULT ((0)) FOR [DistributorValue]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_DiscountPercentage]  DEFAULT ((0)) FOR [DiscountPercentage]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_ReturnedAmount]  DEFAULT ((0)) FOR [ReturnedAmount]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_NetAmount]  DEFAULT ((0)) FOR [NetAmount]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_PaidAmount]  DEFAULT ((0)) FOR [PaidAmount]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_Status]  DEFAULT ('N') FOR [Status]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[PaymentType] ADD  CONSTRAINT [DF_PaymentType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PaymentType] ADD  CONSTRAINT [DF_PaymentType_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[PaymentType] ADD  CONSTRAINT [DF_PaymentType_IsSync]  DEFAULT ((0)) FOR [IsSync]
GO
ALTER TABLE [dbo].[PaymentType] ADD  CONSTRAINT [DF_PaymentType_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[Personal] ADD  CONSTRAINT [DF_Personal_IsEPF]  DEFAULT ((0)) FOR [IsEPF]
GO
ALTER TABLE [dbo].[Personal] ADD  CONSTRAINT [DF_Personal_BasicSalary]  DEFAULT ((0)) FOR [BasicSalary]
GO
ALTER TABLE [dbo].[Personal] ADD  CONSTRAINT [DF_Personal_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Personal] ADD  CONSTRAINT [DF_Personal_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Personal] ADD  CONSTRAINT [DF_Personal_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[Personal] ADD  CONSTRAINT [defval_Personal]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[PersonalAllowanceType] ADD  CONSTRAINT [DF_PersonalAllowanceType_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PersonalAllowanceType] ADD  CONSTRAINT [DF_PersonalAllowanceType_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[PersonalAllowanceType] ADD  CONSTRAINT [defval_PersonalAllowanceType]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[PersonalEmployeeType] ADD  CONSTRAINT [DF_PersonalEmployeeType_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PersonalEmployeeType] ADD  CONSTRAINT [DF_PersonalEmployeeType_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[PersonalEmployeeType] ADD  CONSTRAINT [defval_PersonalEmployeeType]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[PersonalLoan] ADD  CONSTRAINT [DF_PersonalLoan_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PersonalLoan] ADD  CONSTRAINT [DF_PersonalLoan_AmountRequested]  DEFAULT ((0)) FOR [AmountRequested]
GO
ALTER TABLE [dbo].[PersonalLoan] ADD  CONSTRAINT [DF_PersonalLoan_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[PersonalLoan] ADD  CONSTRAINT [defval_PersonalLoan]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[PersonalOverTimeType] ADD  CONSTRAINT [DF_PersonalOverTimeType_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PersonalOverTimeType] ADD  CONSTRAINT [DF_PersonalOverTimeType_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[PersonalOverTimeType] ADD  CONSTRAINT [defval_PersonalOverTimeType]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[PersonalSalaryType] ADD  CONSTRAINT [DF_PersonalSalaryType_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PersonalSalaryType] ADD  CONSTRAINT [DF_PersonalSalaryType_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[PersonalSalaryType] ADD  CONSTRAINT [defval_PersonalSalaryType]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CostPrice]  DEFAULT ((0)) FOR [CostPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_MinimumPrice]  DEFAULT ((0)) FOR [MinimumPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_RetailPrice]  DEFAULT ((0)) FOR [RetailPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_WholesalePrice]  DEFAULT ((0)) FOR [WholesalePrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_DistributorPrice]  DEFAULT ((0)) FOR [DistributorPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsOpenPrice]  DEFAULT ((0)) FOR [IsOpenPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsReturnable]  DEFAULT ((1)) FOR [IsReturnable]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_MonitorExpiry]  DEFAULT ((1)) FOR [MonitorExpiry]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_TrackInventory]  DEFAULT ((1)) FOR [TrackInventory]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Rol]  DEFAULT ((0)) FOR [ROL]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Roq]  DEFAULT ((0)) FOR [ROQ]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Attribute]  DEFAULT ((0)) FOR [Attribute]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[ProductAttribute] ADD  CONSTRAINT [DF_ProductAttributeGroup_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ProductAttribute] ADD  CONSTRAINT [DF_ProductAttribute_IsMandatory]  DEFAULT ((0)) FOR [IsMandatory]
GO
ALTER TABLE [dbo].[ProductAttribute] ADD  CONSTRAINT [DF_ProductAttributeGroup_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductAttribute] ADD  CONSTRAINT [DF_ProductAttributeGroup_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[ProductAttributeItem] ADD  CONSTRAINT [DF_ProductAttributeItem_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ProductAttributeItem] ADD  CONSTRAINT [DF_ProductAttributeItem_MasterProductAttributeItemId]  DEFAULT (newid()) FOR [MasterProductAttributeItemId]
GO
ALTER TABLE [dbo].[ProductAttributeItem] ADD  CONSTRAINT [DF_ProductAttributeItem_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductAttributeItem] ADD  CONSTRAINT [DF_ProductAttributeItem_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[ProductBarcode] ADD  CONSTRAINT [DF_ProductBarcode_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ProductBarcode] ADD  CONSTRAINT [DF_ProductBarcode_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductBarcode] ADD  CONSTRAINT [DF_ProductBarcode_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[ProductBundleUp] ADD  CONSTRAINT [DF_ProductBundleUp_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ProductBundleUp] ADD  CONSTRAINT [DF_ProductBundleUp_IsMandatory]  DEFAULT ((1)) FOR [IsMandatory]
GO
ALTER TABLE [dbo].[ProductBundleUp] ADD  CONSTRAINT [DF_ProductBundleUp_MinimumQty]  DEFAULT ((0)) FOR [MinimumQty]
GO
ALTER TABLE [dbo].[ProductBundleUp] ADD  CONSTRAINT [DF_ProductBundleUp_MaximumQty]  DEFAULT ((0)) FOR [MaximumQty]
GO
ALTER TABLE [dbo].[ProductBundleUp] ADD  CONSTRAINT [DF_ProductBundleUp_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF_ProductGroup_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF_ProductGroup_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF_ProductGroup_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[ProductImge] ADD  CONSTRAINT [DF_ProductImge_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[ProductSubGroup] ADD  CONSTRAINT [DF_ProductSubGroup_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ProductSubGroup] ADD  CONSTRAINT [DF_ProductSubGroup_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductSubGroup] ADD  CONSTRAINT [DF_ProductSubGroup_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[ProductSupplier] ADD  CONSTRAINT [DF_ProductSupplier_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ProductSupplier] ADD  CONSTRAINT [DF_ProductSupplier_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductSupplier] ADD  CONSTRAINT [DF_ProductSupplier_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_DatePrepared]  DEFAULT (getdate()) FOR [DatePrepared]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_CostValue]  DEFAULT ((0)) FOR [CostValue]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_WholesaleValue]  DEFAULT ((0)) FOR [WholesaleValue]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_RetailValue]  DEFAULT ((0)) FOR [RetailValue]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_DistributorValue]  DEFAULT ((0)) FOR [DistributorValue]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_DiscountPercentage]  DEFAULT ((0)) FOR [DiscountPercentage]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_ReturnedAmount]  DEFAULT ((0)) FOR [ReturnedAmount]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_NetAmount]  DEFAULT ((0)) FOR [NetAmount]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Status]  DEFAULT ('N') FOR [Status]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[PurchaseOrderItem] ADD  CONSTRAINT [DF_PurchaseOrderItem_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[RoleSubMenu] ADD  CONSTRAINT [DF_RoleSubMenu_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[RoleSubMenu] ADD  CONSTRAINT [DF_RoleSubMenu_AccessView]  DEFAULT ((1)) FOR [AccessView]
GO
ALTER TABLE [dbo].[RoleSubMenu] ADD  CONSTRAINT [DF_RoleSubMenu_AccessAdd]  DEFAULT ((0)) FOR [AccessAdd]
GO
ALTER TABLE [dbo].[RoleSubMenu] ADD  CONSTRAINT [DF_RoleSubMenu_AccessEdit]  DEFAULT ((0)) FOR [AccessEdit]
GO
ALTER TABLE [dbo].[RoleSubMenu] ADD  CONSTRAINT [DF_RoleSubMenu_AccessDelete]  DEFAULT ((0)) FOR [AccessDelete]
GO
ALTER TABLE [dbo].[RoleSubMenu] ADD  CONSTRAINT [DF_RoleSubMenu_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[RoleSubMenu] ADD  CONSTRAINT [defval_RoleSubMenu]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[StockReturnOrder] ADD  CONSTRAINT [DF_StockReturnOrder_DatePrepared]  DEFAULT (getdate()) FOR [DatePrepared]
GO
ALTER TABLE [dbo].[StockReturnOrder] ADD  CONSTRAINT [DF_StockReturnOrder_CostValue]  DEFAULT ((0)) FOR [CostValue]
GO
ALTER TABLE [dbo].[StockReturnOrder] ADD  CONSTRAINT [DF_StockReturnOrder_WholesaleValue]  DEFAULT ((0)) FOR [WholesaleValue]
GO
ALTER TABLE [dbo].[StockReturnOrder] ADD  CONSTRAINT [DF_StockReturnOrder_RetailValue]  DEFAULT ((0)) FOR [RetailValue]
GO
ALTER TABLE [dbo].[StockReturnOrder] ADD  CONSTRAINT [DF_StockReturnOrder_DistributorValue]  DEFAULT ((0)) FOR [DistributorValue]
GO
ALTER TABLE [dbo].[StockReturnOrder] ADD  CONSTRAINT [DF_StockReturnOrder_DiscountPercentage]  DEFAULT ((0)) FOR [DiscountPercentage]
GO
ALTER TABLE [dbo].[StockReturnOrder] ADD  CONSTRAINT [DF_StockReturnOrder_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[StockReturnOrder] ADD  CONSTRAINT [DF_StockReturnOrder_ReturnedAmount]  DEFAULT ((0)) FOR [ReturnedAmount]
GO
ALTER TABLE [dbo].[StockReturnOrder] ADD  CONSTRAINT [DF_StockReturnOrder_NetAmount]  DEFAULT ((0)) FOR [NetAmount]
GO
ALTER TABLE [dbo].[StockReturnOrder] ADD  CONSTRAINT [DF_StockReturnOrder_Status]  DEFAULT ('N') FOR [Status]
GO
ALTER TABLE [dbo].[StockReturnOrder] ADD  CONSTRAINT [DF_StockReturnOrder_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[SubProductType] ADD  CONSTRAINT [DF_SubProductType_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[SubProductType] ADD  CONSTRAINT [DF_SubProductType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SubProductType] ADD  CONSTRAINT [DF_SubProductType_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[Suspend] ADD  CONSTRAINT [DF_Suspend_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Suspend] ADD  CONSTRAINT [DF_Suspend_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[SystemRole] ADD  CONSTRAINT [DF_SystemRole_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[SystemRole] ADD  CONSTRAINT [defval_SystemRole]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[SystemUser] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SystemUser] ADD  CONSTRAINT [DF_User_IsLockedOut]  DEFAULT ((0)) FOR [IsLockedOut]
GO
ALTER TABLE [dbo].[SystemUser] ADD  CONSTRAINT [DF_User_IsSuperUser]  DEFAULT ((0)) FOR [IsSuperUser]
GO
ALTER TABLE [dbo].[SystemUser] ADD  CONSTRAINT [DF_User_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[SystemUser] ADD  CONSTRAINT [defval_SystemUser]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[UserBranch] ADD  CONSTRAINT [DF_UserBranch_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[UserBranch] ADD  CONSTRAINT [DF_UserBranch_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[UserBranch] ADD  CONSTRAINT [defval_UserBranch]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[UserCompany] ADD  CONSTRAINT [DF_UserCompany_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[UserCompany] ADD  CONSTRAINT [DF_UserCompany_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[UserCompany] ADD  CONSTRAINT [defval_UserCompany]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[UserRole] ADD  CONSTRAINT [DF_UserRole_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[UserRole] ADD  CONSTRAINT [DF_UserRole_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[UserRole] ADD  CONSTRAINT [defval_UserRole]  DEFAULT ((1)) FOR [IsSync]
GO
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_Tstamp]  DEFAULT (getdate()) FOR [Tstamp]
GO
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_IsSync]  DEFAULT ((0)) FOR [IsSync]
GO
ALTER TABLE [dbo].[AppMainMenu]  WITH CHECK ADD  CONSTRAINT [FK_AppMainMenu_Enterprise] FOREIGN KEY([EnterpriseId])
REFERENCES [dbo].[Enterprise] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AppMainMenu] CHECK CONSTRAINT [FK_AppMainMenu_Enterprise]
GO
ALTER TABLE [dbo].[AppSubMenu]  WITH CHECK ADD  CONSTRAINT [FK_AppSubMenu_AppMainMenu] FOREIGN KEY([MainMenuId])
REFERENCES [dbo].[AppMainMenu] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AppSubMenu] CHECK CONSTRAINT [FK_AppSubMenu_AppMainMenu]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_Company]
GO
ALTER TABLE [dbo].[ClientType]  WITH CHECK ADD  CONSTRAINT [FK_VendorType_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[ClientType] CHECK CONSTRAINT [FK_VendorType_Company]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Enterprise] FOREIGN KEY([EnterpriseId])
REFERENCES [dbo].[Enterprise] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Enterprise]
GO
ALTER TABLE [dbo].[DispatchOrder]  WITH CHECK ADD  CONSTRAINT [FK_DispatchOrder_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DispatchOrder] CHECK CONSTRAINT [FK_DispatchOrder_Company]
GO
ALTER TABLE [dbo].[Distributor]  WITH CHECK ADD  CONSTRAINT [FK_Distributor_Enterprise] FOREIGN KEY([EnterpriseId])
REFERENCES [dbo].[Enterprise] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Distributor] CHECK CONSTRAINT [FK_Distributor_Enterprise]
GO
ALTER TABLE [dbo].[Distributor]  WITH CHECK ADD  CONSTRAINT [FK_Distributor_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([Id])
GO
ALTER TABLE [dbo].[Distributor] CHECK CONSTRAINT [FK_Distributor_PaymentType]
GO
ALTER TABLE [dbo].[MainMenu]  WITH CHECK ADD  CONSTRAINT [FK_MainMenu_Enterprise] FOREIGN KEY([EnterpriseId])
REFERENCES [dbo].[Enterprise] ([Id])
GO
ALTER TABLE [dbo].[MainMenu] CHECK CONSTRAINT [FK_MainMenu_Enterprise]
GO
ALTER TABLE [dbo].[MasterEmployeeType]  WITH CHECK ADD  CONSTRAINT [FK_MasterEmployeeType_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterEmployeeType] CHECK CONSTRAINT [FK_MasterEmployeeType_Company]
GO
ALTER TABLE [dbo].[MasterGender]  WITH CHECK ADD  CONSTRAINT [FK_MasterGender_Enterprise] FOREIGN KEY([EnterpriseId])
REFERENCES [dbo].[Enterprise] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterGender] CHECK CONSTRAINT [FK_MasterGender_Enterprise]
GO
ALTER TABLE [dbo].[MasterLeaveType]  WITH CHECK ADD  CONSTRAINT [FK_MasterLeaveType_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterLeaveType] CHECK CONSTRAINT [FK_MasterLeaveType_Company]
GO
ALTER TABLE [dbo].[MasterOverTimeType]  WITH CHECK ADD  CONSTRAINT [FK_MasterOverTimeType_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterOverTimeType] CHECK CONSTRAINT [FK_MasterOverTimeType_Company]
GO
ALTER TABLE [dbo].[MasterProductAttributeItem]  WITH CHECK ADD  CONSTRAINT [FK_MasterProductAttributeItem_MasterProductAttribute] FOREIGN KEY([MasterProductAttributeId])
REFERENCES [dbo].[MasterProductAttribute] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterProductAttributeItem] CHECK CONSTRAINT [FK_MasterProductAttributeItem_MasterProductAttribute]
GO
ALTER TABLE [dbo].[MasterSalaryType]  WITH CHECK ADD  CONSTRAINT [FK_MasterSalaryType_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterSalaryType] CHECK CONSTRAINT [FK_MasterSalaryType_Company]
GO
ALTER TABLE [dbo].[MasterTerminationType]  WITH CHECK ADD  CONSTRAINT [FK_MasterTerminationType_Enterprise] FOREIGN KEY([EnterpriseId])
REFERENCES [dbo].[Enterprise] ([Id])
GO
ALTER TABLE [dbo].[MasterTerminationType] CHECK CONSTRAINT [FK_MasterTerminationType_Enterprise]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Company]
GO
ALTER TABLE [dbo].[PaymentType]  WITH CHECK ADD  CONSTRAINT [FK_PaymentType_Enterprise] FOREIGN KEY([EnterpriseId])
REFERENCES [dbo].[Enterprise] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PaymentType] CHECK CONSTRAINT [FK_PaymentType_Enterprise]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_MasterGender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[MasterGender] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_MasterGender]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_MasterTerminationType] FOREIGN KEY([TerminationTypeId])
REFERENCES [dbo].[MasterTerminationType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_MasterTerminationType]
GO
ALTER TABLE [dbo].[PersonalAllowanceType]  WITH CHECK ADD  CONSTRAINT [FK_PersonalAllowanceType_MasterAllowanceType] FOREIGN KEY([AllowanceTypeId])
REFERENCES [dbo].[MasterAllowanceType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonalAllowanceType] CHECK CONSTRAINT [FK_PersonalAllowanceType_MasterAllowanceType]
GO
ALTER TABLE [dbo].[PersonalAllowanceType]  WITH CHECK ADD  CONSTRAINT [FK_PersonalAllowanceType_Personal] FOREIGN KEY([PersonalId])
REFERENCES [dbo].[Personal] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonalAllowanceType] CHECK CONSTRAINT [FK_PersonalAllowanceType_Personal]
GO
ALTER TABLE [dbo].[PersonalEmployeeType]  WITH CHECK ADD  CONSTRAINT [FK_PersonalEmployeeType_MasterEmployeeType] FOREIGN KEY([EmployeeTypeId])
REFERENCES [dbo].[MasterEmployeeType] ([Id])
GO
ALTER TABLE [dbo].[PersonalEmployeeType] CHECK CONSTRAINT [FK_PersonalEmployeeType_MasterEmployeeType]
GO
ALTER TABLE [dbo].[PersonalEmployeeType]  WITH CHECK ADD  CONSTRAINT [FK_PersonalEmployeeType_Personal] FOREIGN KEY([PersonalId])
REFERENCES [dbo].[Personal] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonalEmployeeType] CHECK CONSTRAINT [FK_PersonalEmployeeType_Personal]
GO
ALTER TABLE [dbo].[PersonalLoan]  WITH CHECK ADD  CONSTRAINT [FK_PersonalLoan_MasterLoanType] FOREIGN KEY([LoanTypeId])
REFERENCES [dbo].[MasterLoanType] ([Id])
GO
ALTER TABLE [dbo].[PersonalLoan] CHECK CONSTRAINT [FK_PersonalLoan_MasterLoanType]
GO
ALTER TABLE [dbo].[PersonalLoan]  WITH CHECK ADD  CONSTRAINT [FK_PersonalLoan_Personal] FOREIGN KEY([PersonalId])
REFERENCES [dbo].[Personal] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonalLoan] CHECK CONSTRAINT [FK_PersonalLoan_Personal]
GO
ALTER TABLE [dbo].[PersonalOverTimeType]  WITH CHECK ADD  CONSTRAINT [FK_PersonalOverTimeType_MasterOverTimeType] FOREIGN KEY([OverTimeTypeId])
REFERENCES [dbo].[MasterOverTimeType] ([Id])
GO
ALTER TABLE [dbo].[PersonalOverTimeType] CHECK CONSTRAINT [FK_PersonalOverTimeType_MasterOverTimeType]
GO
ALTER TABLE [dbo].[PersonalOverTimeType]  WITH CHECK ADD  CONSTRAINT [FK_PersonalOverTimeType_Personal] FOREIGN KEY([PersonalId])
REFERENCES [dbo].[Personal] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonalOverTimeType] CHECK CONSTRAINT [FK_PersonalOverTimeType_Personal]
GO
ALTER TABLE [dbo].[PersonalSalaryType]  WITH CHECK ADD  CONSTRAINT [FK_PersonalSalaryType_MasterSalaryType] FOREIGN KEY([SalaryTypeId])
REFERENCES [dbo].[MasterSalaryType] ([Id])
GO
ALTER TABLE [dbo].[PersonalSalaryType] CHECK CONSTRAINT [FK_PersonalSalaryType_MasterSalaryType]
GO
ALTER TABLE [dbo].[PersonalSalaryType]  WITH CHECK ADD  CONSTRAINT [FK_PersonalSalaryType_Personal] FOREIGN KEY([PersonalId])
REFERENCES [dbo].[Personal] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonalSalaryType] CHECK CONSTRAINT [FK_PersonalSalaryType_Personal]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductSubGroup] FOREIGN KEY([ProductSubgroupId])
REFERENCES [dbo].[ProductSubGroup] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductSubGroup]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductSupplier] FOREIGN KEY([ProductSupplierId])
REFERENCES [dbo].[ProductSupplier] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductSupplier]
GO
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_MasterProductAttribute] FOREIGN KEY([MasterProductAttributeId])
REFERENCES [dbo].[MasterProductAttribute] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_MasterProductAttribute]
GO
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
ALTER TABLE [dbo].[ProductAttributeItem]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributeItem_MasterProductAttributeItem] FOREIGN KEY([MasterProductAttributeItemId])
REFERENCES [dbo].[MasterProductAttributeItem] ([Id])
GO
ALTER TABLE [dbo].[ProductAttributeItem] CHECK CONSTRAINT [FK_ProductAttributeItem_MasterProductAttributeItem]
GO
ALTER TABLE [dbo].[ProductAttributeItem]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributeItem_ProductAttribute] FOREIGN KEY([ProductAttributeId])
REFERENCES [dbo].[ProductAttribute] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductAttributeItem] CHECK CONSTRAINT [FK_ProductAttributeItem_ProductAttribute]
GO
ALTER TABLE [dbo].[ProductBarcode]  WITH CHECK ADD  CONSTRAINT [FK_ProductBarcode_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductBarcode] CHECK CONSTRAINT [FK_ProductBarcode_Product]
GO
ALTER TABLE [dbo].[ProductBundleUp]  WITH CHECK ADD  CONSTRAINT [FK_ProductBundleUp_SubProductType] FOREIGN KEY([SubProductId])
REFERENCES [dbo].[SubProductType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductBundleUp] CHECK CONSTRAINT [FK_ProductBundleUp_SubProductType]
GO
ALTER TABLE [dbo].[ProductGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroup_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[ProductGroup] CHECK CONSTRAINT [FK_ProductGroup_Company]
GO
ALTER TABLE [dbo].[ProductImge]  WITH CHECK ADD  CONSTRAINT [FK_ProductImge_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImge] CHECK CONSTRAINT [FK_ProductImge_Product]
GO
ALTER TABLE [dbo].[ProductSubGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubGroup_ProductGroup] FOREIGN KEY([ProductGroupId])
REFERENCES [dbo].[ProductGroup] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSubGroup] CHECK CONSTRAINT [FK_ProductSubGroup_ProductGroup]
GO
ALTER TABLE [dbo].[ProductSupplier]  WITH CHECK ADD  CONSTRAINT [FK_ProductSupplier_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSupplier] CHECK CONSTRAINT [FK_ProductSupplier_Company]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_ClientType] FOREIGN KEY([ClientTypeId])
REFERENCES [dbo].[ClientType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_ClientType]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_Company]
GO
ALTER TABLE [dbo].[PurchaseOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrderItem] CHECK CONSTRAINT [FK_PurchaseOrderItem_Product]
GO
ALTER TABLE [dbo].[PurchaseOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderItem_PurchaseOrder] FOREIGN KEY([PurchaseOrderId])
REFERENCES [dbo].[PurchaseOrder] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrderItem] CHECK CONSTRAINT [FK_PurchaseOrderItem_PurchaseOrder]
GO
ALTER TABLE [dbo].[RoleSubMenu]  WITH CHECK ADD  CONSTRAINT [FK_RoleSubMenu_AppSubMenu] FOREIGN KEY([AppSubMenuId])
REFERENCES [dbo].[AppSubMenu] ([Id])
GO
ALTER TABLE [dbo].[RoleSubMenu] CHECK CONSTRAINT [FK_RoleSubMenu_AppSubMenu]
GO
ALTER TABLE [dbo].[RoleSubMenu]  WITH CHECK ADD  CONSTRAINT [FK_RoleSubMenu_SystemRole] FOREIGN KEY([SystemRoleId])
REFERENCES [dbo].[SystemRole] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleSubMenu] CHECK CONSTRAINT [FK_RoleSubMenu_SystemRole]
GO
ALTER TABLE [dbo].[StockReturnOrder]  WITH CHECK ADD  CONSTRAINT [FK_StockReturnOrder_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StockReturnOrder] CHECK CONSTRAINT [FK_StockReturnOrder_Company]
GO
ALTER TABLE [dbo].[SubMenu]  WITH CHECK ADD  CONSTRAINT [FK_SubMenu_MainMenu] FOREIGN KEY([MainMenuId])
REFERENCES [dbo].[MainMenu] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubMenu] CHECK CONSTRAINT [FK_SubMenu_MainMenu]
GO
ALTER TABLE [dbo].[SubMenuRole]  WITH CHECK ADD  CONSTRAINT [FK_SubMenuRole_SubMenu] FOREIGN KEY([AppSubMenuId])
REFERENCES [dbo].[SubMenu] ([Id])
GO
ALTER TABLE [dbo].[SubMenuRole] CHECK CONSTRAINT [FK_SubMenuRole_SubMenu]
GO
ALTER TABLE [dbo].[SubMenuRole]  WITH CHECK ADD  CONSTRAINT [FK_SubMenuRole_SystemRole] FOREIGN KEY([SystemRoleId])
REFERENCES [dbo].[SystemRole] ([Id])
GO
ALTER TABLE [dbo].[SubMenuRole] CHECK CONSTRAINT [FK_SubMenuRole_SystemRole]
GO
ALTER TABLE [dbo].[SubProductType]  WITH CHECK ADD  CONSTRAINT [FK_SubProductType_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubProductType] CHECK CONSTRAINT [FK_SubProductType_Company]
GO
ALTER TABLE [dbo].[Suspend]  WITH CHECK ADD  CONSTRAINT [FK_Suspend_SystemUser] FOREIGN KEY([SystemUserId])
REFERENCES [dbo].[SystemUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Suspend] CHECK CONSTRAINT [FK_Suspend_SystemUser]
GO
ALTER TABLE [dbo].[SystemRole]  WITH CHECK ADD  CONSTRAINT [FK_SystemRole_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SystemRole] CHECK CONSTRAINT [FK_SystemRole_Company]
GO
ALTER TABLE [dbo].[SystemUser]  WITH CHECK ADD  CONSTRAINT [FK_User_Enterprise] FOREIGN KEY([EnterpriseId])
REFERENCES [dbo].[Enterprise] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SystemUser] CHECK CONSTRAINT [FK_User_Enterprise]
GO
ALTER TABLE [dbo].[UserBranch]  WITH CHECK ADD  CONSTRAINT [FK_UserBranch_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserBranch] CHECK CONSTRAINT [FK_UserBranch_Branch]
GO
ALTER TABLE [dbo].[UserBranch]  WITH CHECK ADD  CONSTRAINT [FK_UserBranch_SystemUser] FOREIGN KEY([SystemUserId])
REFERENCES [dbo].[SystemUser] ([Id])
GO
ALTER TABLE [dbo].[UserBranch] CHECK CONSTRAINT [FK_UserBranch_SystemUser]
GO
ALTER TABLE [dbo].[UserCompany]  WITH CHECK ADD  CONSTRAINT [FK_UserCompany_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserCompany] CHECK CONSTRAINT [FK_UserCompany_Company]
GO
ALTER TABLE [dbo].[UserCompany]  WITH CHECK ADD  CONSTRAINT [FK_UserCompany_SystemUser] FOREIGN KEY([SystemUserId])
REFERENCES [dbo].[SystemUser] ([Id])
GO
ALTER TABLE [dbo].[UserCompany] CHECK CONSTRAINT [FK_UserCompany_SystemUser]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_SystemRole] FOREIGN KEY([SystemRoleId])
REFERENCES [dbo].[SystemRole] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_SystemRole]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_SystemUser] FOREIGN KEY([SystemUserId])
REFERENCES [dbo].[SystemUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_SystemUser]
GO
/****** Object:  StoredProcedure [dbo].[xsp_getClientBalanceList]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xsp_getClientBalanceList] 
@type int
AS
BEGIN

	IF (@type = 1)
		BEGIN
			SELECT        D.Id, D.EnterpriseId, D.Name, D.Description, D.Address, D.ContactNo, D.Email, D.DepositAmount, D.PaymentTypeId, D.CreditPeriod, D.IsActive, D.IsSuspect, D.SuspectReason, D.IsDelete, D.Tstamp, D.IsSync, 
									 PT.Name AS PaymentType, 

			SUM(ISNULL(P.CostValue, 0)) AS PCostValue, SUM(ISNULL(P.WholesaleValue, 0)) AS PWholesaleValue, SUM(ISNULL(P.RetailValue, 0)) AS PRetailValue, SUM(ISNULL(P.DistributorValue, 0)) AS PDistributorValue, 
			SUM(ISNULL(P.DiscountAmount, 0)) AS PDiscountAmount, SUM(ISNULL(P.ReturnedAmount, 0)) AS PReturnedAmount, SUM(ISNULL(P.NetAmount, 0)) AS PNetAmount, SUM(ISNULL(P.PaidAmount, 0)) AS PPaidAmount,

			SUM(ISNULL(DO.CostValue, 0)) AS DCostValue, SUM(ISNULL(DO.WholesaleValue, 0)) AS DWholesaleValue, SUM(ISNULL(DO.RetailValue, 0)) AS DRetailValue, SUM(ISNULL(DO.DistributorValue, 0)) AS DDistributorValue, 
			SUM(ISNULL(DO.DiscountAmount, 0)) AS DDiscountAmount, SUM(ISNULL(DO.ReturnedAmount, 0)) AS DReturnedAmount, SUM(ISNULL(DO.NetAmount, 0)) AS DNetAmount, 

			SUM(ISNULL(S.CostValue, 0)) AS SCostValue, SUM(ISNULL(S.WholesaleValue, 0)) AS SWholesaleValue, SUM(ISNULL(S.RetailValue, 0)) AS SRetailValue, SUM(ISNULL(S.DistributorValue, 0)) AS SDistributorValue, 
			SUM(ISNULL(S.DiscountAmount, 0)) AS SDiscountAmount, SUM(ISNULL(S.ReturnedAmount, 0)) AS SReturnedAmount, SUM(ISNULL(S.NetAmount, 0)) AS SNetAmount,

			D.DepositAmount - SUM(ISNULL(DO.CostValue, 0)) + SUM(ISNULL(S.CostValue, 0)) - SUM(ISNULL(P.CostValue, 0)) AS BCostValue, 
			D.DepositAmount - SUM(ISNULL(DO.WholesaleValue, 0)) + SUM(ISNULL(S.WholesaleValue, 0)) + SUM(ISNULL(P.WholesaleValue, 0)) AS BWholesaleValue, 
			D.DepositAmount - SUM(ISNULL(DO.RetailValue, 0)) + SUM(ISNULL(S.RetailValue, 0)) + SUM(ISNULL(S.RetailValue, 0)) AS BRetailValue, 
			D.DepositAmount - SUM(ISNULL(DO.DistributorValue, 0)) + SUM(ISNULL(S.DistributorValue, 0)) + SUM(ISNULL(S.DistributorValue, 0)) AS BDistributorValue, 
			D.DepositAmount - SUM(ISNULL(DO.NetAmount, 0)) + SUM(ISNULL(S.NetAmount, 0)) + SUM(ISNULL(S.NetAmount, 0)) AS BNetAmount

			FROM            PaymentType AS PT INNER JOIN
									 Distributor AS D ON PT.Id = D.PaymentTypeId LEFT OUTER JOIN
									 PurchaseOrder AS PO ON D.Id = PO.ClientId LEFT OUTER JOIN
									 StockReturnOrder AS S ON D.Id = S.ClientId LEFT OUTER JOIN
									 DispatchOrder AS DO ON D.Id = DO.ClientId LEFT OUTER JOIN
									 Payment AS P ON D.Id = P.ClientId
			GROUP BY PT.Name, D.IsSync, D.Tstamp, D.IsDelete, D.SuspectReason, D.IsSuspect, D.IsActive, D.CreditPeriod, D.PaymentTypeId, D.DepositAmount, D.Email, D.ContactNo, D.Address, D.Description, D.Name, D.EnterpriseId, D.Id
		END
END
GO
/****** Object:  StoredProcedure [dbo].[xsp_getSystemRole]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[xsp_getSystemRole]
AS
BEGIN

SELECT        S.Id AS SubMenuId, S.MainMenuId, S.Description, S.URL, S.SeqNo, S.IsActive, S.IsSync, M.Id AS RoleSubMenuId, R.Id AS SystemRoleId, M.AppSubMenuId, ISNULL(M.AccessView, 0) AS AccessView, ISNULL(M.AccessAdd, 0) 
                         AS AccessAdd, ISNULL(M.AccessEdit, 0) AS AccessEdit, ISNULL(M.AccessDelete, 0) AS AccessDelete, R.CompanyId, R.Name, R.Description AS SystemRoleDescription
FROM            AppSubMenu AS S LEFT OUTER JOIN
                         RoleSubMenu AS M ON S.Id = M.AppSubMenuId FULL OUTER JOIN
                         SystemRole AS R ON M.SystemRoleId = R.Id

END
GO
/****** Object:  StoredProcedure [dbo].[xsp_getUserBranchesList]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[xsp_getUserBranchesList] 
	@enterpriseId int,
	@userId uniqueidentifier
AS
BEGIN

SET NOCOUNT ON;

IF	@userId IS NOT NULL

BEGIN
SELECT        B.Id, B.CompanyId, B.Name, B.Description, B.IsActive, B.IsDeleted, B.Tstamp, B.IsSync
FROM            Branch AS B INNER JOIN
                         UserBranch AS U ON B.Id = U.BranchId INNER JOIN
                         Company AS C ON B.CompanyId = C.Id
WHERE        (U.SystemUserId = @userId) AND (C.EnterpriseId = @enterpriseId)

END

ELSE

BEGIN
SELECT        B.Id, B.CompanyId, B.Name, B.Description, B.IsActive, B.IsDeleted, B.Tstamp, B.IsSync
FROM            Branch AS B INNER JOIN
                         UserBranch AS U ON B.Id = U.BranchId INNER JOIN
                         Company AS C ON B.CompanyId = C.Id
WHERE        (C.EnterpriseId = @enterpriseId)
END

END
GO
/****** Object:  StoredProcedure [dbo].[xsp_getUserCompaniesList]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[xsp_getUserCompaniesList] 
	@enterpriseId int,
	@userId uniqueidentifier
AS
BEGIN

SET NOCOUNT ON;

Select C.* from Company C, UserCompany U Where C.Id = U.CompanyId AND U.SystemUserId = @userId AND C.EnterpriseId = @enterpriseId

END
GO
/****** Object:  StoredProcedure [dbo].[xsp_getUserMainMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[xsp_getUserMainMenu]
--@userId nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;

SELECT        Distinct M.Description AS MainMenu, M.Id, M.Icon, M.SeqNo
FROM            UserRole AS l INNER JOIN
                         SystemUser AS U ON l.SystemUserId = U.Id INNER JOIN
                         SystemRole AS e ON l.SystemRoleId = e.Id INNER JOIN
                         AppMainMenu AS M INNER JOIN
                         AppSubMenu AS S ON M.Id = S.MainMenuId INNER JOIN
                         RoleSubMenu AS R ON S.Id = R.AppSubMenuId ON e.Id = R.SystemRoleId
Where M.IsActive = 1
Order By M.SeqNo
END
GO
/****** Object:  StoredProcedure [dbo].[xsp_getUserRoleMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[xsp_getUserRoleMenu]
@userId nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;

SELECT        M.Description AS MainMenu, M.Icon, M.SeqNo, S.Id, S.Description AS SubMenu ,S.MainMenuId, S.URL, S.SeqNo AS SubSeqNo
FROM            UserRole AS l INNER JOIN
                         SystemUser AS U ON l.SystemUserId = U.Id INNER JOIN
                         SystemRole AS e ON l.SystemRoleId = e.Id INNER JOIN
                         AppMainMenu AS M INNER JOIN
                         AppSubMenu AS S ON M.Id = S.MainMenuId INNER JOIN
                         RoleSubMenu AS R ON S.Id = R.AppSubMenuId ON e.Id = R.SystemRoleId
Where M.IsActive = 1 AND S.IsActive = 1 AND U.IsActive = 1 AND U.Id = @userId
Order By M.SeqNo, S.SeqNo
END
GO
/****** Object:  StoredProcedure [dbo].[xsp_getUserSubMenu]    Script Date: 9/30/2021 9:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[xsp_getUserSubMenu]
@userId nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;

SELECT r.*
FROM            UserRole AS l INNER JOIN
                         SystemUser AS U ON l.SystemUserId = U.Id INNER JOIN
                         SystemRole AS e ON l.SystemRoleId = e.Id INNER JOIN
                         MainMenu AS M INNER JOIN
                         SubMenu AS S ON M.Id = S.MainMenuId INNER JOIN
                         RoleSubMenu AS R ON S.Id = R.AppSubMenuId ON e.Id = R.SystemRoleId
Where M.IsActive = 1 AND S.IsActive = 1 AND U.IsActive = 1 AND U.Id = @userId
Order By M.SeqNo, S.SeqNo
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 678
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1485
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_MasterProductAttributeItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_MasterProductAttributeItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 269
               Bottom = 136
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "G"
            Begin Extent = 
               Top = 6
               Left = 481
               Bottom = 136
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 689
               Bottom = 136
               Right = 859
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Product'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Product'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 136
               Right = 548
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 586
               Bottom = 136
               Right = 756
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 794
               Bottom = 136
               Right = 1018
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductAttribute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductAttribute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 269
               Bottom = 136
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "G"
            Begin Extent = 
               Top = 6
               Left = 481
               Bottom = 136
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 689
               Bottom = 136
               Right = 859
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductSubGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductSubGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductSupplier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ProductSupplier'
GO
