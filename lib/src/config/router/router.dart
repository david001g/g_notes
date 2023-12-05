import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/features/authentication/domain/entities/user.dart';
import 'package:g_notes/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_notes/src/features/authentication/view/pages/profile_screen.dart';
import 'package:g_notes/src/features/categories/view/bloc/category_cubit.dart';
import 'package:g_notes/src/features/categories/view/pages/categories_home.dart';
import 'package:g_notes/src/features/introduction/introduction_page.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';
import 'package:g_notes/src/features/notes/view/bloc/notes_cubit.dart';
import 'package:g_notes/src/features/notes/view/pages/create_note.dart';
import 'package:g_notes/src/features/notes/view/pages/notes_home.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  login,
  register,
  profile,
  categories,
  notes,
  note,
  category,
  createCategory,
  createNote,
  updateCategory,
  updateNote,
}

final goRouter = GoRouter(
  initialLocation: fba.FirebaseAuth.instance.currentUser != null ? "/${AppRoute.notes.name}" : "/",
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const IntroductionPage(),
      routes: [
        GoRoute(
            redirect: (context, state) async {
              String? id = fba.FirebaseAuth.instance.currentUser?.uid;
              if (id != null) {
                return "/${AppRoute.notes.name}";
              }
            },
            path: 'login',
            name: AppRoute.login.name,
            builder: (context, state) => SignInScreen(
                  showAuthActionSwitch: false,
                  showPasswordVisibilityToggle: true,
                  subtitleBuilder: (context, provider) {
                    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Test User: test@test.com - 123456", style: TextStyle(color: Colors.green))),
                      Gap(10.h),
                      Row(
                        children: [
                          const Text("Don't have an account?", style: TextStyle(color: Colors.black45)),
                          Gap(5.w),
                          InkWell(
                            onTap: () => context.goNamed(AppRoute.register.name),
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            mouseCursor: SystemMouseCursors.click,
                            child: const Text(
                              "Register",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          )
                        ],
                      )
                    ]);
                  },
                  providers: [
                    EmailAuthProvider(),
                    GoogleProvider(clientId: "269545314442-4u4sql3kj50001pkeudkla4inoa10ljq.apps.googleusercontent.com"),
                    AppleProvider(),
                    FacebookProvider(clientId: "1:269545314442:web:2d5f771818570de15cf573"),
                  ],
                  actions: [
                    AuthStateChangeAction<SignedIn>((context, state) {
                      String? id = fba.FirebaseAuth.instance.currentUser?.uid;
                      if (id != null && id == "DLk6mtaw4aMg7HshkC7vwixYCW53") {
                        context.read<NotesCubit>().deleteAllNotes();
                        context.read<CategoryCubit>().deleteAllCategories();
                        context
                            .read<AuthenticationCubit>()
                            .updateUser(UserEntity(id: id, name: "Your name", email: "test@test.com", image: null));
                      }
                      context.goNamed(AppRoute.notes.name);
                    }),
                    AuthStateChangeAction<SigningUp>((context, state) {
                      context.goNamed(AppRoute.register.name);
                    }),
                  ],
                )),
        GoRoute(
          redirect: (context, state) {
            if (fba.FirebaseAuth.instance.currentUser != null) {
              return "/${AppRoute.notes.name}";
            }
          },
          path: 'register',
          name: AppRoute.register.name,
          builder: (context, state) => RegisterScreen(
            showAuthActionSwitch: false,
            subtitleBuilder: (context, provider) {
              return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  children: [
                    const Text("Already have an account?", style: TextStyle(color: Colors.black45)),
                    Gap(5.w),
                    InkWell(
                      onTap: () => context.goNamed(AppRoute.login.name),
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      mouseCursor: SystemMouseCursors.click,
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    )
                  ],
                )
              ]);
            },
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: "269545314442-4u4sql3kj50001pkeudkla4inoa10ljq.apps.googleusercontent.com"),
              AppleProvider(),
              FacebookProvider(clientId: "1:269545314442:web:2d5f771818570de15cf573"),
            ],
            actions: [
              AuthStateChangeAction<UserCreated>((context, state) async {
                String? id = fba.FirebaseAuth.instance.currentUser?.uid;
                var currentUser = await context.read<AuthenticationCubit>().getUser(id!);
                if (context.mounted) {
                  if (currentUser == null) {
                    context.read<AuthenticationCubit>().register();
                    await context.read<AuthenticationCubit>().getUser(id!);
                  }
                }
                context.goNamed(AppRoute.notes.name);
              }),
            ],
          ),
        ),
        GoRoute(
          redirect: (context, state) {
            if (fba.FirebaseAuth.instance.currentUser == null) {
              return "/${AppRoute.login.name}";
            }
          },
          path: 'categories',
          name: AppRoute.categories.name,
          builder: (context, state) => const CategoriesHome(),
        ),
        GoRoute(
          redirect: (context, state) {
            if (fba.FirebaseAuth.instance.currentUser == null) {
              return "/${AppRoute.login.name}";
            }
          },
          path: 'notes',
          name: AppRoute.notes.name,
          builder: (context, state) => const NotesHome(),
          routes: [
            GoRoute(
              path: 'edit',
              name: AppRoute.updateNote.name,
              builder: (context, state) {
                final NoteEntity? note = state.extra as NoteEntity?;
                return CreateNote(
                  note: note,
                );
              },
            ),
            GoRoute(
              path: 'create',
              name: AppRoute.createNote.name,
              builder: (context, state) => CreateNote(),
            ),
          ],
        ),
        GoRoute(
            redirect: (context, state) {
              if (fba.FirebaseAuth.instance.currentUser == null) {
                return "/${AppRoute.login.name}";
              }
            },
            path: 'profile',
            name: AppRoute.profile.name,
            builder: (context, state) => const CustomProfileScreen()),
      ],
    ),
  ],
);
