/****** Object:  Table [dbo].[Timestamp]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timestamp](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[systemTime] [bigint] NOT NULL,
	[timezone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Timestamp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[User]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[claimedIdentifier] [nvarchar](max) NOT NULL,
	[friendlyIdentifier] [nvarchar](max) NULL,
	[secret] [nvarchar](max) NOT NULL,
	[displayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[NeighbouringCells]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeighbouringCells](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_NeighbouringCells] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[LoggerIdentifier]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoggerIdentifier](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[uniqueID] [nvarchar](100) NOT NULL,
	[version] [int] NOT NULL,
 CONSTRAINT [PK_Identifier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 CONSTRAINT [UK_Identifier] UNIQUE NONCLUSTERED 
(
	[uniqueID] ASC,
	[version] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[LogEntry]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogEntry](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[loggerIdentifierID] [bigint] NOT NULL,
	[timestampID] [bigint] NOT NULL,
	[locationID] [bigint] NULL,
	[userID] [bigint] NULL,
 CONSTRAINT [PK_LogEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[NeighbouringCell]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeighbouringCell](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[lac] [int] NOT NULL,
	[psc] [int] NOT NULL,
	[rssi] [int] NOT NULL,
	[networkType] [nvarchar](50) NOT NULL,
	[neighbouringCellsID] [bigint] NOT NULL,
 CONSTRAINT [PK_NeighbouringCell] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[WifiScanResult]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WifiScanResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[bssid] [nvarchar](max) NOT NULL,
	[ssid] [nvarchar](max) NOT NULL,
	[capabilities] [nvarchar](max) NOT NULL,
	[frequency] [int] NOT NULL,
	[level] [int] NOT NULL,
	[logEntryID] [bigint] NOT NULL,
 CONSTRAINT [PK_Wifi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Unrecognised]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unrecognised](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[blobUri] [nvarchar](max) NOT NULL,
	[logEntryID] [bigint] NOT NULL,
 CONSTRAINT [PK_Unrecognised] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[SignalStrength]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SignalStrength](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[cdmaDbm] [int] NOT NULL,
	[cdmaEcio] [int] NOT NULL,
	[evdoDbm] [int] NOT NULL,
	[evdoEcio] [int] NOT NULL,
	[evdoSnr] [int] NOT NULL,
	[gsmBitErrorRate] [int] NOT NULL,
	[gsmSignalStrength] [int] NOT NULL,
	[isGsm] [bit] NOT NULL,
	[logEntryID] [bigint] NOT NULL,
 CONSTRAINT [PK_SignalStrength] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[ServiceState]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceState](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[isManualSelection] [bit] NOT NULL,
	[operatorAlphaLong] [nvarchar](50) NOT NULL,
	[operatorAlphaShort] [nvarchar](50) NOT NULL,
	[operatorNumeric] [nvarchar](50) NOT NULL,
	[roaming] [bit] NOT NULL,
	[state] [nvarchar](50) NOT NULL,
	[logEntryID] [bigint] NOT NULL,
 CONSTRAINT [PK_ServiceState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[PositionStatusChanged]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PositionStatusChanged](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[provider] [nvarchar](max) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[extras] [text] NULL,
	[logEntryID] [bigint] NOT NULL,
 CONSTRAINT [PK_PositionStatusChanged] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[PositionProviderEnabledDisabled]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PositionProviderEnabledDisabled](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[isEnabled] [bit] NOT NULL,
	[provider] [nvarchar](max) NOT NULL,
	[logEntryID] [bigint] NOT NULL,
 CONSTRAINT [PK_ProviderEnabledDisabled] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[GsmCellLocation]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GsmCellLocation](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[lac] [int] NOT NULL,
	[neighbouringCellsID] [bigint] NULL,
	[logEntryID] [bigint] NOT NULL,
 CONSTRAINT [PK_GsmCellLocation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[DataConnectionState]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataConnectionState](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[state] [nvarchar](50) NOT NULL,
	[networkType] [nvarchar](50) NOT NULL,
	[logEntryID] [bigint] NOT NULL,
 CONSTRAINT [PK_DataConnectionState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[CdmaCellLocation]    Script Date: 03/19/2012 17:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CdmaCellLocation](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[baseStationId] [int] NOT NULL,
	[baseStationLatitude] [int] NOT NULL,
	[baseStationLongitude] [int] NOT NULL,
	[networkId] [int] NOT NULL,
	[systemId] [int] NOT NULL,
	[neighbouringCellsID] [bigint] NULL,
	[logEntryID] [bigint] NOT NULL,
 CONSTRAINT [PK_CdmaCellLocation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Default [DF_User_]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_]  DEFAULT (NULL) FOR [displayName]
GO
/****** Object:  Check [CK_DataConnectionState_networkType]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[DataConnectionState]  WITH CHECK ADD  CONSTRAINT [CK_DataConnectionState_networkType] CHECK  (([networkType]='NETWORK_TYPE_1xRTT' OR [networkType]='NETWORK_TYPE_CDMA' OR [networkType]='NETWORK_TYPE_EDGE' OR [networkType]='NETWORK_TYPE_EVDO_0' OR [networkType]='NETWORK_TYPE_EVDO_A' OR [networkType]='NETWORK_TYPE_GPRS' OR [networkType]='NETWORK_TYPE_HSDPA' OR [networkType]='NETWORK_TYPE_HSPA' OR [networkType]='NETWORK_TYPE_HSUPA' OR [networkType]='NETWORK_TYPE_UMTS' OR [networkType]='NETWORK_TYPE_UNKNOWN'))
GO
ALTER TABLE [dbo].[DataConnectionState] CHECK CONSTRAINT [CK_DataConnectionState_networkType]
GO
/****** Object:  Check [CK_DataConnectionState_state]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[DataConnectionState]  WITH CHECK ADD  CONSTRAINT [CK_DataConnectionState_state] CHECK  (([state]='DATA_CONNECTED' OR [state]='DATA_CONNECTING' OR [state]='DATA_DISCONNECTED' OR [state]='DATA_SUSPENDED' OR [state]='DATA_UNKNOWN'))
GO
ALTER TABLE [dbo].[DataConnectionState] CHECK CONSTRAINT [CK_DataConnectionState_state]
GO
/****** Object:  Check [CK_NeighbouringCell_networkType]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[NeighbouringCell]  WITH CHECK ADD  CONSTRAINT [CK_NeighbouringCell_networkType] CHECK  (([networkType]='NETWORK_TYPE_1xRTT' OR [networkType]='NETWORK_TYPE_CDMA' OR [networkType]='NETWORK_TYPE_EDGE' OR [networkType]='NETWORK_TYPE_EVDO_0' OR [networkType]='NETWORK_TYPE_EVDO_A' OR [networkType]='NETWORK_TYPE_GPRS' OR [networkType]='NETWORK_TYPE_HSDPA' OR [networkType]='NETWORK_TYPE_HSPA' OR [networkType]='NETWORK_TYPE_HSUPA' OR [networkType]='NETWORK_TYPE_UMTS' OR [networkType]='NETWORK_TYPE_UNKNOWN'))
GO
ALTER TABLE [dbo].[NeighbouringCell] CHECK CONSTRAINT [CK_NeighbouringCell_networkType]
GO
/****** Object:  Check [CK_PositionStatusChanged]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[PositionStatusChanged]  WITH CHECK ADD  CONSTRAINT [CK_PositionStatusChanged] CHECK  (([status]='AVAILABLE' OR [status]='OUT_OF_SERVICE' OR [status]='TEMPORARILY_UNAVAILABLE' OR [status]='UNKNOWN'))
GO
ALTER TABLE [dbo].[PositionStatusChanged] CHECK CONSTRAINT [CK_PositionStatusChanged]
GO
/****** Object:  Check [CK_ServiceState_state]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[ServiceState]  WITH CHECK ADD  CONSTRAINT [CK_ServiceState_state] CHECK  (([state]='STATE_EMERGENCY_ONLY' OR [state]='STATE_IN_SERVICE' OR [state]='STATE_OUT_OF_SERVICE' OR [state]='STATE_POWER_OFF' OR [state]='STATE_UNKNOWN'))
GO
ALTER TABLE [dbo].[ServiceState] CHECK CONSTRAINT [CK_ServiceState_state]
GO
/****** Object:  ForeignKey [FK_CdmaCellLocation_LogEntry]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[CdmaCellLocation]  WITH CHECK ADD  CONSTRAINT [FK_CdmaCellLocation_LogEntry] FOREIGN KEY([logEntryID])
REFERENCES [dbo].[LogEntry] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CdmaCellLocation] CHECK CONSTRAINT [FK_CdmaCellLocation_LogEntry]
GO
/****** Object:  ForeignKey [FK_CdmaCellLocation_NeighbouringCells]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[CdmaCellLocation]  WITH CHECK ADD  CONSTRAINT [FK_CdmaCellLocation_NeighbouringCells] FOREIGN KEY([neighbouringCellsID])
REFERENCES [dbo].[NeighbouringCells] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CdmaCellLocation] CHECK CONSTRAINT [FK_CdmaCellLocation_NeighbouringCells]
GO
/****** Object:  ForeignKey [FK_DataConnectionState_LogEntry]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[DataConnectionState]  WITH CHECK ADD  CONSTRAINT [FK_DataConnectionState_LogEntry] FOREIGN KEY([logEntryID])
REFERENCES [dbo].[LogEntry] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DataConnectionState] CHECK CONSTRAINT [FK_DataConnectionState_LogEntry]
GO
/****** Object:  ForeignKey [FK_GsmCellLocation_LogEntry]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[GsmCellLocation]  WITH CHECK ADD  CONSTRAINT [FK_GsmCellLocation_LogEntry] FOREIGN KEY([logEntryID])
REFERENCES [dbo].[LogEntry] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GsmCellLocation] CHECK CONSTRAINT [FK_GsmCellLocation_LogEntry]
GO
/****** Object:  ForeignKey [FK_GsmCellLocation_NeighbouringCells]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[GsmCellLocation]  WITH CHECK ADD  CONSTRAINT [FK_GsmCellLocation_NeighbouringCells] FOREIGN KEY([neighbouringCellsID])
REFERENCES [dbo].[NeighbouringCells] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[GsmCellLocation] CHECK CONSTRAINT [FK_GsmCellLocation_NeighbouringCells]
GO
/****** Object:  ForeignKey [FK_LogEntry_Location]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[LogEntry]  WITH CHECK ADD  CONSTRAINT [FK_LogEntry_Location] FOREIGN KEY([locationID])
REFERENCES [dbo].[Location] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LogEntry] CHECK CONSTRAINT [FK_LogEntry_Location]
GO
/****** Object:  ForeignKey [FK_LogEntry_LoggerIdentifier]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[LogEntry]  WITH CHECK ADD  CONSTRAINT [FK_LogEntry_LoggerIdentifier] FOREIGN KEY([loggerIdentifierID])
REFERENCES [dbo].[LoggerIdentifier] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LogEntry] CHECK CONSTRAINT [FK_LogEntry_LoggerIdentifier]
GO
/****** Object:  ForeignKey [FK_LogEntry_Timestamp]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[LogEntry]  WITH CHECK ADD  CONSTRAINT [FK_LogEntry_Timestamp] FOREIGN KEY([timestampID])
REFERENCES [dbo].[Timestamp] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LogEntry] CHECK CONSTRAINT [FK_LogEntry_Timestamp]
GO
/****** Object:  ForeignKey [FK_LogEntry_User]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[LogEntry]  WITH CHECK ADD  CONSTRAINT [FK_LogEntry_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LogEntry] CHECK CONSTRAINT [FK_LogEntry_User]
GO
/****** Object:  ForeignKey [FK_NeighbouringCell_NeighbouringCells]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[NeighbouringCell]  WITH CHECK ADD  CONSTRAINT [FK_NeighbouringCell_NeighbouringCells] FOREIGN KEY([neighbouringCellsID])
REFERENCES [dbo].[NeighbouringCells] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NeighbouringCell] CHECK CONSTRAINT [FK_NeighbouringCell_NeighbouringCells]
GO
/****** Object:  ForeignKey [FK_PositionProviderEnabledDisabled_LogEntry]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[PositionProviderEnabledDisabled]  WITH CHECK ADD  CONSTRAINT [FK_PositionProviderEnabledDisabled_LogEntry] FOREIGN KEY([logEntryID])
REFERENCES [dbo].[LogEntry] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PositionProviderEnabledDisabled] CHECK CONSTRAINT [FK_PositionProviderEnabledDisabled_LogEntry]
GO
/****** Object:  ForeignKey [FK_PositionStatusChanged_LogEntry]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[PositionStatusChanged]  WITH CHECK ADD  CONSTRAINT [FK_PositionStatusChanged_LogEntry] FOREIGN KEY([logEntryID])
REFERENCES [dbo].[LogEntry] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PositionStatusChanged] CHECK CONSTRAINT [FK_PositionStatusChanged_LogEntry]
GO
/****** Object:  ForeignKey [FK_ServiceState_LogEntry]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[ServiceState]  WITH CHECK ADD  CONSTRAINT [FK_ServiceState_LogEntry] FOREIGN KEY([logEntryID])
REFERENCES [dbo].[LogEntry] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceState] CHECK CONSTRAINT [FK_ServiceState_LogEntry]
GO
/****** Object:  ForeignKey [FK_SignalStrength_LogEntry]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[SignalStrength]  WITH CHECK ADD  CONSTRAINT [FK_SignalStrength_LogEntry] FOREIGN KEY([logEntryID])
REFERENCES [dbo].[LogEntry] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SignalStrength] CHECK CONSTRAINT [FK_SignalStrength_LogEntry]
GO
/****** Object:  ForeignKey [FK_Unrecognised_LogEntry]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[Unrecognised]  WITH CHECK ADD  CONSTRAINT [FK_Unrecognised_LogEntry] FOREIGN KEY([logEntryID])
REFERENCES [dbo].[LogEntry] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Unrecognised] CHECK CONSTRAINT [FK_Unrecognised_LogEntry]
GO
/****** Object:  ForeignKey [FK_WifiScanResult_LogEntry]    Script Date: 03/19/2012 17:34:39 ******/
ALTER TABLE [dbo].[WifiScanResult]  WITH CHECK ADD  CONSTRAINT [FK_WifiScanResult_LogEntry] FOREIGN KEY([logEntryID])
REFERENCES [dbo].[LogEntry] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WifiScanResult] CHECK CONSTRAINT [FK_WifiScanResult_LogEntry]
GO
