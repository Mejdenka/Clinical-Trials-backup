SELECT [s].[Id], [i].[BriefTitle], [o].[OrgFullName], [c2].[Condition], [d0].[BriefSummary], [e].[EligibilityCriteria], [s1].[OverallStatus], 
CONVERT(VARCHAR(100), [s1].[LastUpdateSubmitDate]) AS [LastUpdateSubmitDate]
FROM [Studies] AS [s]
LEFT JOIN [FullStudy] AS [f] ON [s].[FullStudyId] = [f].[Id]
LEFT JOIN [Study] AS [s0] ON [f].[StudyId] = [s0].[Id]
LEFT JOIN [DerivedSection] AS [d] ON [s0].[DerivedSectionId] = [d].[Id]
LEFT JOIN [ConditionBrowseModule] AS [c] ON [d].[ConditionBrowseModuleId] = [c].[Id]
LEFT JOIN [ConditionMeshList] AS [c0] ON [c].[ConditionMeshListId] = [c0].[Id]
LEFT JOIN [ProtocolSection] AS [p] ON [s0].[ProtocolSectionId] = [p].[Id]
LEFT JOIN [IdentificationModule] AS [i] ON [p].[IdentificationModuleId] = [i].[Id]
LEFT JOIN [Organization] AS [o] ON [i].[OrganizationId] = [o].[Id]
LEFT JOIN [ConditionsModule] AS [c1] ON [p].[ConditionsModuleId] = [c1].[Id]
LEFT JOIN [ConditionList] AS [c2] ON [c1].[ConditionListId] = [c2].[Id]
LEFT JOIN [DescriptionModule] AS [d0] ON [p].[DescriptionModuleId] = [d0].[Id]
LEFT JOIN [EligibilityModule] AS [e] ON [p].[EligibilityModuleId] = [e].[Id]
LEFT JOIN [StatusModule] AS [s1] ON [p].[StatusModuleId] = [s1].[Id]
WHERE EXISTS (
    SELECT 1
    FROM [ConditionMesh] AS [c3]
    WHERE ([c0].[Id] IS NOT NULL AND ([c0].[Id] = [c3].[ConditionMeshListId])) AND (('hyper' = N'') 
	OR (CHARINDEX('hyper', LOWER([c3].[ConditionMeshTerm])) > 0)))

SELECT [s].[Id], [s].[FullStudyId]
FROM [Studies] AS [s]
LEFT JOIN [FullStudy] AS [f] ON [s].[FullStudyId] = [f].[Id]
LEFT JOIN [Study] AS [s0] ON [f].[StudyId] = [s0].[Id]
LEFT JOIN [ProtocolSection] AS [p] ON [s0].[ProtocolSectionId] = [p].[Id]
LEFT JOIN [ContactsLocationsModule] AS [c] ON [p].[ContactsLocationsModuleId] = [c].[Id]
LEFT JOIN [LocationList] AS [l] ON [c].[LocationListId] = [l].[Id]
WHERE EXISTS (
    SELECT 1
    FROM [Location] AS [l0]
    WHERE ([l].[Id] IS NOT NULL AND ([l].[Id] = [l0].[LocationListId])) AND (('china' = N'') 
	OR (CHARINDEX('china', LOWER([l0].[LocationCountry])) > 0)))


SELECT [s].[Id], [s].[FullStudyId]
FROM [Studies] AS [s]
LEFT JOIN [FullStudy] AS [f] ON [s].[FullStudyId] = [f].[Id]
LEFT JOIN [Study] AS [s0] ON [f].[StudyId] = [s0].[Id]
LEFT JOIN [ProtocolSection] AS [p] ON [s0].[ProtocolSectionId] = [p].[Id]
LEFT JOIN [IdentificationModule] AS [i] ON [p].[IdentificationModuleId] = [i].[Id]
LEFT JOIN [Organization] AS [o] ON [i].[OrganizationId] = [o].[Id]
WHERE ('nei' = N'') OR (CHARINDEX('nei', LOWER([o].[OrgFullName])) > 0)