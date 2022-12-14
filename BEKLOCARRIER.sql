USE [BEKLOCARRIER]
GO
ALTER TABLE [dbo].[tracking] DROP CONSTRAINT [FK_tracking_request]
GO
ALTER TABLE [dbo].[service] DROP CONSTRAINT [FK_service_product_type]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [FK_request_service]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [FK_request_regional_state1]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [FK_request_regional_state]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [FK_request_product_type]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [FK_request_city1]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [FK_request_city]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [FK_request_area1]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [FK_request_area]
GO
ALTER TABLE [dbo].[payment] DROP CONSTRAINT [FK_payment_request]
GO
ALTER TABLE [dbo].[city] DROP CONSTRAINT [FK_city_regional_state]
GO
ALTER TABLE [dbo].[area] DROP CONSTRAINT [FK_area_city]
GO
ALTER TABLE [dbo].[address] DROP CONSTRAINT [FK_address_regional_state]
GO
ALTER TABLE [dbo].[address] DROP CONSTRAINT [FK_address_city]
GO
ALTER TABLE [dbo].[address] DROP CONSTRAINT [FK_address_area]
GO
ALTER TABLE [dbo].[service] DROP CONSTRAINT [DF__service__service__25869641]
GO
ALTER TABLE [dbo].[request] DROP CONSTRAINT [DF__request__pickup___22AA2996]
GO
ALTER TABLE [dbo].[payment] DROP CONSTRAINT [DF__payment__status__1BFD2C07]
GO
/****** Object:  Table [dbo].[tracking]    Script Date: 08/14/2022 12:04:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tracking]') AND type in (N'U'))
DROP TABLE [dbo].[tracking]
GO
/****** Object:  Table [dbo].[service]    Script Date: 08/14/2022 12:04:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[service]') AND type in (N'U'))
DROP TABLE [dbo].[service]
GO
/****** Object:  Table [dbo].[request]    Script Date: 08/14/2022 12:04:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[request]') AND type in (N'U'))
DROP TABLE [dbo].[request]
GO
/****** Object:  Table [dbo].[regional_state]    Script Date: 08/14/2022 12:04:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[regional_state]') AND type in (N'U'))
DROP TABLE [dbo].[regional_state]
GO
/****** Object:  Table [dbo].[product_type]    Script Date: 08/14/2022 12:04:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[product_type]') AND type in (N'U'))
DROP TABLE [dbo].[product_type]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 08/14/2022 12:04:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payment]') AND type in (N'U'))
DROP TABLE [dbo].[payment]
GO
/****** Object:  Table [dbo].[city]    Script Date: 08/14/2022 12:04:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[city]') AND type in (N'U'))
DROP TABLE [dbo].[city]
GO
/****** Object:  Table [dbo].[area]    Script Date: 08/14/2022 12:04:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[area]') AND type in (N'U'))
DROP TABLE [dbo].[area]
GO
/****** Object:  Table [dbo].[address]    Script Date: 08/14/2022 12:04:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[address]') AND type in (N'U'))
DROP TABLE [dbo].[address]
GO
/****** Object:  Table [dbo].[address]    Script Date: 08/14/2022 12:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[regionl_state_name] [int] NULL,
	[city_name] [int] NULL,
	[area_name] [int] NULL,
	[Specific_Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[area]    Script Date: 08/14/2022 12:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[area](
	[area_id] [int] IDENTITY(1,1) NOT NULL,
	[area_name] [varchar](max) NOT NULL,
	[city_name] [int] NULL,
	[regional_state_name] [int] NULL,
 CONSTRAINT [PK_area] PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 08/14/2022 12:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [nvarchar](50) NOT NULL,
	[regional_state_name] [int] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 08/14/2022 12:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[carrier_payment_id] [int] IDENTITY(1,1) NOT NULL,
	[pickupid] [int] NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[payment_mode] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[carrier_payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_type]    Script Date: 08/14/2022 12:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_type](
	[product_type_id] [int] IDENTITY(1,1) NOT NULL,
	[product_type_name] [nvarchar](50) NOT NULL,
	[transport_method_available] [nvarchar](50) NULL,
	[type_of_transport_available] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_product_type] PRIMARY KEY CLUSTERED 
(
	[product_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regional_state]    Script Date: 08/14/2022 12:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regional_state](
	[regional_state_id] [int] IDENTITY(1,1) NOT NULL,
	[regional_state_name] [nvarchar](50) NOT NULL,
	[image] [varchar](max) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_regional_state] PRIMARY KEY CLUSTERED 
(
	[regional_state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[request]    Script Date: 08/14/2022 12:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request](
	[pickup_id] [int] IDENTITY(1,1) NOT NULL,
	[sender_name] [nvarchar](50) NOT NULL,
	[sender_address] [nvarchar](max) NOT NULL,
	[s_phone_no] [nvarchar](40) NOT NULL,
	[s_email] [nvarchar](256) NOT NULL,
	[s_regional_state_name] [int] NULL,
	[s_city_name] [int] NULL,
	[s_area_name] [int] NULL,
	[reciever_name] [nvarchar](50) NOT NULL,
	[reciver_address] [nvarchar](max) NOT NULL,
	[r_phone_no] [nvarchar](40) NOT NULL,
	[r_email] [nvarchar](256) NULL,
	[r_regional_state_name] [int] NULL,
	[r_city_name] [int] NULL,
	[r_area_name] [int] NULL,
	[s_branch_name] [nvarchar](50) NULL,
	[r_branch_name] [nvarchar](50) NULL,
	[agent_name] [nvarchar](50) NULL,
	[pickup_detail_added_date] [datetime] NULL,
	[pickup_date] [date] NULL,
	[delivery_date] [date] NULL,
	[service_id] [int] NULL,
	[product_type] [int] NULL,
	[final_cost] [decimal](18, 2) NULL,
	[reference_no]  AS (rand((1000000))),
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_request] PRIMARY KEY CLUSTERED 
(
	[pickup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 08/14/2022 12:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](50) NOT NULL,
	[service_provided_to] [nvarchar](50) NOT NULL,
	[service_start_date] [datetime] NOT NULL,
	[service_fee] [decimal](18, 2) NOT NULL,
	[pickup_from] [int] NULL,
	[dropdown_to] [int] NULL,
	[pickup_cost] [decimal](18, 0) NOT NULL,
	[product_type_name] [int] NULL,
	[weight] [int] NOT NULL,
	[unit_price] [decimal](18, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[total_charge]  AS (([pickup_cost]+([weight]*[quantity])*[unit_price])+[service_fee]),
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tracking]    Script Date: 08/14/2022 12:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tracking](
	[tracking_id] [int] IDENTITY(1,1) NOT NULL,
	[pickup_id] [int] NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tracking] PRIMARY KEY CLUSTERED 
(
	[tracking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[payment] ADD  CONSTRAINT [DF__payment__status__1BFD2C07]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[request] ADD  CONSTRAINT [DF__request__pickup___22AA2996]  DEFAULT (getdate()) FOR [pickup_detail_added_date]
GO
ALTER TABLE [dbo].[service] ADD  CONSTRAINT [DF__service__service__25869641]  DEFAULT (getdate()) FOR [service_start_date]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_area] FOREIGN KEY([area_name])
REFERENCES [dbo].[area] ([area_id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_area]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_city] FOREIGN KEY([city_name])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_city]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_regional_state] FOREIGN KEY([regionl_state_name])
REFERENCES [dbo].[regional_state] ([regional_state_id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_regional_state]
GO
ALTER TABLE [dbo].[area]  WITH CHECK ADD  CONSTRAINT [FK_area_city] FOREIGN KEY([city_name])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[area] CHECK CONSTRAINT [FK_area_city]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [FK_city_regional_state] FOREIGN KEY([regional_state_name])
REFERENCES [dbo].[regional_state] ([regional_state_id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [FK_city_regional_state]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_request] FOREIGN KEY([pickupid])
REFERENCES [dbo].[request] ([pickup_id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_request]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_area] FOREIGN KEY([s_area_name])
REFERENCES [dbo].[area] ([area_id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_area]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_area1] FOREIGN KEY([r_area_name])
REFERENCES [dbo].[area] ([area_id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_area1]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_city] FOREIGN KEY([r_city_name])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_city]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_city1] FOREIGN KEY([s_city_name])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_city1]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_product_type] FOREIGN KEY([product_type])
REFERENCES [dbo].[product_type] ([product_type_id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_product_type]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_regional_state] FOREIGN KEY([r_regional_state_name])
REFERENCES [dbo].[regional_state] ([regional_state_id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_regional_state]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_regional_state1] FOREIGN KEY([s_regional_state_name])
REFERENCES [dbo].[regional_state] ([regional_state_id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_regional_state1]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_service] FOREIGN KEY([service_id])
REFERENCES [dbo].[service] ([service_id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_service]
GO
ALTER TABLE [dbo].[service]  WITH CHECK ADD  CONSTRAINT [FK_service_product_type] FOREIGN KEY([product_type_name])
REFERENCES [dbo].[product_type] ([product_type_id])
GO
ALTER TABLE [dbo].[service] CHECK CONSTRAINT [FK_service_product_type]
GO
ALTER TABLE [dbo].[tracking]  WITH CHECK ADD  CONSTRAINT [FK_tracking_request] FOREIGN KEY([pickup_id])
REFERENCES [dbo].[request] ([pickup_id])
GO
ALTER TABLE [dbo].[tracking] CHECK CONSTRAINT [FK_tracking_request]
GO
