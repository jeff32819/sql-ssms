USE [Jamin]
GO

/****** Object:  StoredProcedure [dbo].[TaskEmpListByMoverStatus]    Script Date: 09/11/2026 16:42:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- testing for: [TaskEmpListByMoverStatus] 

GO

--EXEC TaskEmpMoverListByMoverStatus 2999, READY, 1 -- Mover
--EXEC TaskEmpMoverListByMoverStatus 2999, READY, 2 -- PreferredMover
--EXEC TaskEmpMoverListByMoverStatus 2999, READY, 3 -- Driver
EXEC TaskEmpMoverListByMoverStatus 2999, READY, 4 -- PreferredDriver
--EXEC TaskEmpMoverListByMoverStatus 2999, READY, 5 -- Weekends
--EXEC TaskEmpMoverListByMoverStatus 2999, READY, 6 -- SpecificDays



