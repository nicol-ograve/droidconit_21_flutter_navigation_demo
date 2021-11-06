//#region Sections and pages

enum Pages {
  Splash,
  Home,
  UserRegistration_AccountForm,
  UserRegistration_UserDataForm,
  UserRegistration_PaymentMethod,
  Login_Form,
  Todo_List,
  Todo_Detail,
  Todo_Create,
  Settings_List,
  Settings_Account,
  Settings_ChangePassword,
  Error
}

enum Sections { Splash, Home, UserRegistration, Login, Settings, Todo, Error }
//#endregion

//#region Paths list

// Splash page path
const String SplashPath = '/';

// Home pages path
const String HomePath = '/home';

// User Registration pages path
const String RegistrationSectionPath = '/registration';
const String AccountRegistrationPath = '$RegistrationSectionPath/account';
const String UserDataRegistrationPath = '$RegistrationSectionPath/user';
const String AddPaymentMethodPath = '$RegistrationSectionPath/payment';

// Login pages path
const String LoginSectionPath = '/login';
const String LoginFormPath = '$LoginSectionPath/form';

//Settings pages paths
const String SettingsSectionPath = '/settings';
const String SettingsAccountPath = '$SettingsSectionPath/account';
const String SettingsChangePasswordPath = '/$SettingsSectionPath/changePassword';

//History pages path
const String TodoSectionPath = '/todo';
const String TodoDetailPath = '$TodoSectionPath/detail';
const String TodoCreatePath = '$TodoSectionPath/create';

// Error pages path
const String ErrorPath = '/error';

//#endregion

class PageConfiguration {
  final String path; // Must be unique because is used as a key
  final Sections section;
  final Pages uiPage;

  const PageConfiguration(
      {required this.path, required this.section, required this.uiPage});
}

//#endregion

//#region Page configurations

// Splash page
const PageConfiguration SplashPageConfig = PageConfiguration(
    path: SplashPath, section: Sections.Splash, uiPage: Pages.Splash);

// Error pages config
const PageConfiguration ErrorPageConfig = PageConfiguration(
    path: ErrorPath, section: Sections.Error, uiPage: Pages.Error);

// Home pages config
const PageConfiguration HomePageConfig = PageConfiguration(
    path: HomePath, section: Sections.Home, uiPage: Pages.Home);

// Settings pages config

const PageConfiguration SettingsListPageConfig = PageConfiguration(
    path: SettingsSectionPath,
    section: Sections.Settings,
    uiPage: Pages.Settings_List);

const PageConfiguration SettingsAccountPageConfig = PageConfiguration(
    path: SettingsAccountPath,
    section: Sections.Settings,
    uiPage: Pages.Settings_Account);

const PageConfiguration SettingsChangePasswordPageConfig = PageConfiguration(
    path: SettingsChangePasswordPath,
    section: Sections.Settings,
    uiPage: Pages.Settings_ChangePassword);

// Todos pages config

const PageConfiguration TodosListPageConfig = PageConfiguration(
    path: TodoSectionPath, section: Sections.Todo, uiPage: Pages.Todo_List);

const PageConfiguration TodosCreatePageConfig = PageConfiguration(
    path: TodoCreatePath, section: Sections.Todo, uiPage: Pages.Todo_Create);

class TodoDetailPageConfig extends PageConfiguration {
  final int todoId;
  const TodoDetailPageConfig({required this.todoId})
      : super(
            path: TodoDetailPath,
            section: Sections.Todo,
            uiPage: Pages.Todo_Detail);
}

// UserRegistration pages config
const PageConfiguration AccountRegistrationPageConfig = PageConfiguration(
    path: AccountRegistrationPath,
    section: Sections.UserRegistration,
    uiPage: Pages.UserRegistration_AccountForm);

const PageConfiguration UserDataRegistrationPageConfig = PageConfiguration(
    path: UserDataRegistrationPath,
    section: Sections.UserRegistration,
    uiPage: Pages.UserRegistration_UserDataForm);

const PageConfiguration AddPaymentMethodPageConfig = PageConfiguration(
    path: AddPaymentMethodPath,
    section: Sections.UserRegistration,
    uiPage: Pages.UserRegistration_PaymentMethod);

// Login pages config
const PageConfiguration Login_LoginFormConfig = PageConfiguration(
    path: LoginSectionPath, section: Sections.Login, uiPage: Pages.Login_Form);


//#endregion