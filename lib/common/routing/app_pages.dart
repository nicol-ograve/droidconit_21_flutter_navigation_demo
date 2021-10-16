//#region Sections and pages

enum Sections { Splash, Home, UserRegistration, Login, Settings, Todo, Error }

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
//#endregion

//#region Paths list

// Splash page path
const String SplashPath = '/splash';

// Home pages path
const String HomePath = '/home';

// User Registration pages path
const String RegistrationPath = '/registration';
const String AccountRegistrationPath = '/registration/account';
const String UserDataRegistrationPath = '/registration/user';
const String AddPaymentMethodPath = '/registration/payment';

// Login pages path
const String LoginPath = '/login';
const String LoginFormPath = '/login/form';

//Settings pages paths
const String SettingsPath = '/settings';
const String SettingsAccountPath = '/settings/account';
const String SettingsChangePasswordPath = '/settings/changePassword';

//History pages path
const String TodoPath = '/todo';
const String TodoDetailPath = '/todo/detail';
const String TodoCreatePath = '/todo/create';

// Error pages path
const String ErrorPath = '/error';

//#endregion

class PageConfiguration {
  final String path; // Must be unique
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
    path: SettingsPath,
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
    path: TodoPath, section: Sections.Todo, uiPage: Pages.Todo_List);

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
    path: LoginPath, section: Sections.Login, uiPage: Pages.Login_Form);


//#endregion