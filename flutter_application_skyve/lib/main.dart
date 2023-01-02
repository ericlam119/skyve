import 'package:flutter_application_skyve/views/admin/audit.dart';
import 'package:flutter_application_skyve/views/admin/change_password.dart';
import 'package:flutter_application_skyve/views/admin/communication.dart';
import 'package:flutter_application_skyve/views/admin/communication_template.dart';
import 'package:flutter_application_skyve/views/admin/configuration.dart';
import 'package:flutter_application_skyve/views/admin/contact.dart';
import 'package:flutter_application_skyve/views/admin/content.dart';
import 'package:flutter_application_skyve/views/admin/control_panel.dart';
import 'package:flutter_application_skyve/views/admin/data_group.dart';
import 'package:flutter_application_skyve/views/admin/data_group_list.dart';
import 'package:flutter_application_skyve/views/admin/data_maintenance.dart';
import 'package:flutter_application_skyve/views/admin/document_creator.dart';
import 'package:flutter_application_skyve/views/admin/document_number.dart';
import 'package:flutter_application_skyve/views/admin/download_folder.dart';
import 'package:flutter_application_skyve/views/admin/dynamic_entity.dart';
import 'package:flutter_application_skyve/views/admin/dynamic_relation.dart';
import 'package:flutter_application_skyve/views/admin/generic.dart';
import 'package:flutter_application_skyve/views/admin/group.dart';
import 'package:flutter_application_skyve/views/admin/group_list.dart';
import 'package:flutter_application_skyve/views/admin/group_role.dart';
import 'package:flutter_application_skyve/views/admin/import_export.dart';
import 'package:flutter_application_skyve/views/admin/import_export_column.dart';
import 'package:flutter_application_skyve/views/admin/job.dart';
import 'package:flutter_application_skyve/views/admin/job_schedule.dart';
import 'package:flutter_application_skyve/views/admin/jobs.dart';
import 'package:flutter_application_skyve/views/admin/module_document.dart';
import 'package:flutter_application_skyve/views/admin/q_audits_list.dart';
import 'package:flutter_application_skyve/views/admin/q_communication_template_list.dart';
import 'package:flutter_application_skyve/views/admin/q_communications_list.dart';
import 'package:flutter_application_skyve/views/admin/q_contacts_list.dart';
import 'package:flutter_application_skyve/views/admin/q_document_numbers_list.dart';
import 'package:flutter_application_skyve/views/admin/q_login_history_list.dart';
import 'package:flutter_application_skyve/views/admin/q_report_schedules_list.dart';
import 'package:flutter_application_skyve/views/admin/q_report_templates_list.dart';
import 'package:flutter_application_skyve/views/admin/q_snapshots_list.dart';
import 'package:flutter_application_skyve/views/admin/q_tags_list.dart';
import 'package:flutter_application_skyve/views/admin/report_dataset.dart';
import 'package:flutter_application_skyve/views/admin/report_design.dart';
import 'package:flutter_application_skyve/views/admin/report_manager.dart';
import 'package:flutter_application_skyve/views/admin/report_parameter.dart';
import 'package:flutter_application_skyve/views/admin/report_template.dart';
import 'package:flutter_application_skyve/views/admin/self_registration.dart';
import 'package:flutter_application_skyve/views/admin/self_registration_activation.dart';
import 'package:flutter_application_skyve/views/admin/snapshot.dart';
import 'package:flutter_application_skyve/views/admin/startup.dart';
import 'package:flutter_application_skyve/views/admin/subscription.dart';
import 'package:flutter_application_skyve/views/admin/system_dashboard.dart';
import 'package:flutter_application_skyve/views/admin/tag.dart';
import 'package:flutter_application_skyve/views/admin/tagged.dart';
import 'package:flutter_application_skyve/views/admin/user.dart';
import 'package:flutter_application_skyve/views/admin/user_candidate_contact.dart';
import 'package:flutter_application_skyve/views/admin/user_dashboard.dart';
import 'package:flutter_application_skyve/views/admin/user_list.dart';
import 'package:flutter_application_skyve/views/admin/user_login_record.dart';
import 'package:flutter_application_skyve/views/admin/user_monthly_hits.dart';
import 'package:flutter_application_skyve/views/admin/user_monthly_hits_list.dart';
import 'package:flutter_application_skyve/views/admin/user_proxy.dart';
import 'package:flutter_application_skyve/views/admin/user_role.dart';
import 'package:flutter_application_skyve/views/admin/user_token.dart';
import 'package:flutter_application_skyve/views/kitchensink/container_grid.dart';
import 'package:flutter_application_skyve/views/kitchensink/data_repeater.dart';
import 'package:flutter_application_skyve/views/kitchensink/inline_grid.dart';
import 'package:flutter_application_skyve/views/kitchensink/kitchen_sink.dart';
import 'package:flutter_application_skyve/views/kitchensink/list_attributes.dart';
import 'package:flutter_application_skyve/views/kitchensink/list_attributes_list.dart';
import 'package:flutter_application_skyve/views/kitchensink/lookup_description.dart';
import 'package:flutter_application_skyve/views/kitchensink/lookup_description_list.dart';
import 'package:flutter_application_skyve/views/kitchensink/ordered_grid.dart';
import 'package:flutter_application_skyve/views/test/all_attributes_dynamic_embedded.dart';
import 'package:flutter_application_skyve/views/test/all_attributes_dynamic_persistent.dart';
import 'package:flutter_application_skyve/views/test/all_attributes_dynamic_persistent_dynamic_child.dart';
import 'package:flutter_application_skyve/views/test/all_attributes_embedded.dart';
import 'package:flutter_application_skyve/views/test/all_attributes_persistent.dart';
import 'package:flutter_application_skyve/views/test/all_attributes_required_persistent.dart';
import 'package:flutter_application_skyve/views/test/all_dynamic_attributes_persistent.dart';
import 'package:flutter_application_skyve/views/test/all_dynamic_attributes_persistent_dynamic_child.dart';
import 'package:flutter_application_skyve/views/test/any_base.dart';
import 'package:flutter_application_skyve/views/test/any_derived1.dart';
import 'package:flutter_application_skyve/views/test/any_derived2.dart';
import 'package:flutter_application_skyve/views/test/arc_one_to_many.dart';
import 'package:flutter_application_skyve/views/test/arc_one_to_one.dart';
import 'package:flutter_application_skyve/views/test/delete_during_post_delete.dart';
import 'package:flutter_application_skyve/views/test/dynamic_mapped_extension.dart';
import 'package:flutter_application_skyve/views/test/dynamic_mapped_subclassed.dart';
import 'package:flutter_application_skyve/views/test/hierarchical.dart';
import 'package:flutter_application_skyve/views/test/injected_document.dart';
import 'package:flutter_application_skyve/views/test/inverse_many_to_many_persistent.dart';
import 'package:flutter_application_skyve/views/test/inverse_one_to_many_persistent.dart';
import 'package:flutter_application_skyve/views/test/inverse_one_to_one_persistent.dart';
import 'package:flutter_application_skyve/views/test/mapped_base.dart';
import 'package:flutter_application_skyve/views/test/mapped_extension_joined_strategy.dart';
import 'package:flutter_application_skyve/views/test/mapped_extension_single_strategy.dart';
import 'package:flutter_application_skyve/views/test/mapped_subclassed_joined_strategy.dart';
import 'package:flutter_application_skyve/views/test/mapped_subclassed_single_strategy.dart';
import 'package:flutter_application_skyve/views/test/reachability.dart';
import 'package:flutter_application_skyve/views/test/unique_constraint_non_nullable.dart';
import 'package:flutter_application_skyve/views/test/unique_constraint_nullable.dart';
import 'package:flutter_application_skyve/views/test/unique_constraint_optimisation.dart';
import 'package:flutter_application_skyve/widgets/skyve_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

const menu = [
  SkyveMenuData(label: 'Password', routeName: AdminChangePassword.routeName),
  SkyveMenuData(label: 'User Dashboard', routeName: AdminUserDashboard.routeName),
  SkyveMenuData(label: 'Contacts', routeName: AdminqContactsList.routeName),
  SkyveMenuData(label: 'Communications', routeName: AdminqCommunicationsList.routeName),
  SkyveMenuData(label: 'Communication Templates', routeName: AdminqCommunicationTemplateList.routeName),
  SkyveMenuData(label: 'Groups', routeName: AdminGroupList.routeName),
  SkyveMenuData(label: 'Users', routeName: AdminUserList.routeName),
  SkyveMenuData(label: 'Data Groups', routeName: AdminDataGroupList.routeName),
  SkyveMenuData(label: 'Configuration', routeName: AdminConfiguration.routeName),
  SkyveMenuData(label: 'Sign In History', routeName: AdminqLoginHistoryList.routeName),
  SkyveMenuData(label: 'Control Panel', routeName: AdminControlPanel.routeName),
  SkyveMenuData(label: 'Data Maintenance', routeName: AdminDataMaintenance.routeName),
  SkyveMenuData(label: 'DocumentCreator', routeName: AdminDocumentCreator.routeName),
  SkyveMenuData(label: 'User Hits', routeName: AdminUserMonthlyHitsList.routeName),
  SkyveMenuData(label: 'Report Manager', routeName: AdminReportManager.routeName),
  SkyveMenuData(label: 'Report Designer', routeName: AdminqReportTemplatesList.routeName),
  SkyveMenuData(label: 'Report Schedules', routeName: AdminqReportSchedulesList.routeName),
  SkyveMenuData(label: 'Snapshots', routeName: AdminqSnapshotsList.routeName),
  SkyveMenuData(label: 'Tags', routeName: AdminqTagsList.routeName),
  SkyveMenuData(label: 'Audits', routeName: AdminqAuditsList.routeName),
  SkyveMenuData(label: 'System Dashboard', routeName: AdminSystemDashboard.routeName),
  SkyveMenuData(label: 'Document Numbers', routeName: AdminqDocumentNumbersList.routeName),
  SkyveMenuData(label: 'Jobs', routeName: AdminJobs.routeName),
  SkyveMenuData(label: 'Kitchen Sink', routeName: KitchensinkKitchenSink.routeName),
  SkyveMenuData(label: 'List', routeName: KitchensinkListAttributesList.routeName),
  SkyveMenuData(label: 'Lookup values', routeName: KitchensinkLookupDescriptionList.routeName)
];

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final routes = <String, WidgetBuilder>{
    AdminAudit.routeName: (context) => const AdminAudit(),
    AdminChangePassword.routeName: (context) => const AdminChangePassword(),
    AdminCommunication.routeName: (context) => const AdminCommunication(),
    AdminCommunicationTemplate.routeName: (context) => const AdminCommunicationTemplate(),
    AdminConfiguration.routeName: (context) => const AdminConfiguration(),
    AdminContact.routeName: (context) => const AdminContact(),
    AdminContent.routeName: (context) => const AdminContent(),
    AdminControlPanel.routeName: (context) => const AdminControlPanel(),
    AdminDataGroup.routeName: (context) => const AdminDataGroup(),
    AdminDataGroupList.routeName: (context) => const AdminDataGroupList(),
    AdminDataMaintenance.routeName: (context) => const AdminDataMaintenance(),
    AdminDocumentCreator.routeName: (context) => const AdminDocumentCreator(),
    AdminDocumentNumber.routeName: (context) => const AdminDocumentNumber(),
    AdminDownloadFolder.routeName: (context) => const AdminDownloadFolder(),
    AdminDynamicEntity.routeName: (context) => const AdminDynamicEntity(),
    AdminDynamicRelation.routeName: (context) => const AdminDynamicRelation(),
    AdminGeneric.routeName: (context) => const AdminGeneric(),
    AdminGroup.routeName: (context) => const AdminGroup(),
    AdminGroupList.routeName: (context) => const AdminGroupList(),
    AdminGroupRole.routeName: (context) => const AdminGroupRole(),
    AdminImportExport.routeName: (context) => const AdminImportExport(),
    AdminImportExportColumn.routeName: (context) => const AdminImportExportColumn(),
    AdminJob.routeName: (context) => const AdminJob(),
    AdminJobSchedule.routeName: (context) => const AdminJobSchedule(),
    AdminJobs.routeName: (context) => const AdminJobs(),
    AdminModuleDocument.routeName: (context) => const AdminModuleDocument(),
    AdminReportDataset.routeName: (context) => const AdminReportDataset(),
    AdminReportDesign.routeName: (context) => const AdminReportDesign(),
    AdminReportManager.routeName: (context) => const AdminReportManager(),
    AdminReportParameter.routeName: (context) => const AdminReportParameter(),
    AdminReportTemplate.routeName: (context) => const AdminReportTemplate(),
    AdminSelfRegistration.routeName: (context) => const AdminSelfRegistration(),
    AdminSelfRegistrationActivation.routeName: (context) => const AdminSelfRegistrationActivation(),
    AdminSnapshot.routeName: (context) => const AdminSnapshot(),
    AdminStartup.routeName: (context) => const AdminStartup(),
    AdminSubscription.routeName: (context) => const AdminSubscription(),
    AdminSystemDashboard.routeName: (context) => const AdminSystemDashboard(),
    AdminTag.routeName: (context) => const AdminTag(),
    AdminTagged.routeName: (context) => const AdminTagged(),
    AdminUser.routeName: (context) => const AdminUser(),
    AdminUserCandidateContact.routeName: (context) => const AdminUserCandidateContact(),
    AdminUserDashboard.routeName: (context) => const AdminUserDashboard(),
    AdminUserList.routeName: (context) => const AdminUserList(),
    AdminUserLoginRecord.routeName: (context) => const AdminUserLoginRecord(),
    AdminUserMonthlyHits.routeName: (context) => const AdminUserMonthlyHits(),
    AdminUserMonthlyHitsList.routeName: (context) => const AdminUserMonthlyHitsList(),
    AdminUserProxy.routeName: (context) => const AdminUserProxy(),
    AdminUserRole.routeName: (context) => const AdminUserRole(),
    AdminUserToken.routeName: (context) => const AdminUserToken(),
    AdminqAuditsList.routeName: (context) => const AdminqAuditsList(),
    AdminqCommunicationTemplateList.routeName: (context) => const AdminqCommunicationTemplateList(),
    AdminqCommunicationsList.routeName: (context) => const AdminqCommunicationsList(),
    AdminqContactsList.routeName: (context) => const AdminqContactsList(),
    AdminqDocumentNumbersList.routeName: (context) => const AdminqDocumentNumbersList(),
    AdminqLoginHistoryList.routeName: (context) => const AdminqLoginHistoryList(),
    AdminqReportSchedulesList.routeName: (context) => const AdminqReportSchedulesList(),
    AdminqReportTemplatesList.routeName: (context) => const AdminqReportTemplatesList(),
    AdminqSnapshotsList.routeName: (context) => const AdminqSnapshotsList(),
    AdminqTagsList.routeName: (context) => const AdminqTagsList(),
    KitchensinkContainerGrid.routeName: (context) => const KitchensinkContainerGrid(),
    KitchensinkDataRepeater.routeName: (context) => const KitchensinkDataRepeater(),
    KitchensinkInlineGrid.routeName: (context) => const KitchensinkInlineGrid(),
    KitchensinkKitchenSink.routeName: (context) => const KitchensinkKitchenSink(),
    KitchensinkListAttributes.routeName: (context) => const KitchensinkListAttributes(),
    KitchensinkListAttributesList.routeName: (context) => const KitchensinkListAttributesList(),
    KitchensinkLookupDescription.routeName: (context) => const KitchensinkLookupDescription(),
    KitchensinkLookupDescriptionList.routeName: (context) => const KitchensinkLookupDescriptionList(),
    KitchensinkOrderedGrid.routeName: (context) => const KitchensinkOrderedGrid(),
    TestAllAttributesDynamicEmbedded.routeName: (context) => const TestAllAttributesDynamicEmbedded(),
    TestAllAttributesDynamicPersistent.routeName: (context) => const TestAllAttributesDynamicPersistent(),
    TestAllAttributesDynamicPersistentDynamicChild.routeName: (context) => const TestAllAttributesDynamicPersistentDynamicChild(),
    TestAllAttributesEmbedded.routeName: (context) => const TestAllAttributesEmbedded(),
    TestAllAttributesPersistent.routeName: (context) => const TestAllAttributesPersistent(),
    TestAllAttributesRequiredPersistent.routeName: (context) => const TestAllAttributesRequiredPersistent(),
    TestAllDynamicAttributesPersistent.routeName: (context) => const TestAllDynamicAttributesPersistent(),
    TestAllDynamicAttributesPersistentDynamicChild.routeName: (context) => const TestAllDynamicAttributesPersistentDynamicChild(),
    TestAnyBase.routeName: (context) => const TestAnyBase(),
    TestAnyDerived1.routeName: (context) => const TestAnyDerived1(),
    TestAnyDerived2.routeName: (context) => const TestAnyDerived2(),
    TestArcOneToMany.routeName: (context) => const TestArcOneToMany(),
    TestArcOneToOne.routeName: (context) => const TestArcOneToOne(),
    TestDeleteDuringPostDelete.routeName: (context) => const TestDeleteDuringPostDelete(),
    TestDynamicMappedExtension.routeName: (context) => const TestDynamicMappedExtension(),
    TestDynamicMappedSubclassed.routeName: (context) => const TestDynamicMappedSubclassed(),
    TestHierarchical.routeName: (context) => const TestHierarchical(),
    TestInjectedDocument.routeName: (context) => const TestInjectedDocument(),
    TestInverseManyToManyPersistent.routeName: (context) => const TestInverseManyToManyPersistent(),
    TestInverseOneToManyPersistent.routeName: (context) => const TestInverseOneToManyPersistent(),
    TestInverseOneToOnePersistent.routeName: (context) => const TestInverseOneToOnePersistent(),
    TestMappedBase.routeName: (context) => const TestMappedBase(),
    TestMappedExtensionJoinedStrategy.routeName: (context) => const TestMappedExtensionJoinedStrategy(),
    TestMappedExtensionSingleStrategy.routeName: (context) => const TestMappedExtensionSingleStrategy(),
    TestMappedSubclassedJoinedStrategy.routeName: (context) => const TestMappedSubclassedJoinedStrategy(),
    TestMappedSubclassedSingleStrategy.routeName: (context) => const TestMappedSubclassedSingleStrategy(),
    TestReachability.routeName: (context) => const TestReachability(),
    TestUniqueConstraintNonNullable.routeName: (context) => const TestUniqueConstraintNonNullable(),
    TestUniqueConstraintNullable.routeName: (context) => const TestUniqueConstraintNullable(),
    TestUniqueConstraintOptimisation.routeName: (context) => const TestUniqueConstraintOptimisation(),
  };


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Skyve',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AdminqContactsList.routeName,
        routes: routes);
  }
}
