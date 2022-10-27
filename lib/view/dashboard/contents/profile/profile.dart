import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import '../../../../models/user_model.dart';
import '../../../../providers/auth.dart';
import '../../../../providers/profileProvider.dart';
import '../../../../styles/widgets/buttons.dart';
import '../../../../styles/widgets/labels.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _InformationState();
}

class _InformationState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ProfileProvider>(context, listen: false).loadUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<ProfileProvider>(
            builder: (context, provider, child) {
              final user = provider.user[0];
              return ProfileWidget(
                user: user,
              );
            },
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.resources.color.colorPrimary,
      ),
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            height: 164,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: context.resources.color.colorWhite,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Align(
              child: Container(
                decoration: BoxDecoration(
                  color: context.resources.color.textSecondary,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: context.resources.color.boxShadow,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Labels.sm(
                                text: 'Full Name',
                                textColor:
                                    context.resources.color.colorLightGray,
                              ),
                              const SizedBox(height: 10),
                              Labels.md(
                                text: user.first_name + ' ' + user.last_name,
                                textColor: context.resources.color.colorDark,
                              ),
                              const SizedBox(height: 10),
                              Divider(
                                color: context.resources.color.colorLightGray,
                                thickness: 1,
                              ),
                              const SizedBox(height: 10),
                              Labels.sm(
                                text: 'Company',
                                textColor:
                                    context.resources.color.colorLightGray,
                              ),
                              const SizedBox(height: 10),
                              Labels.md(
                                text: 'Company Name',
                                textColor: context.resources.color.colorDark,
                              ),
                              const SizedBox(height: 10),
                              Divider(
                                color: context.resources.color.colorLightGray,
                                thickness: 1,
                              ),
                              const SizedBox(height: 10),
                              Labels.sm(
                                text: 'DOT #',
                                textColor:
                                    context.resources.color.colorLightGray,
                              ),
                              const SizedBox(height: 10),
                              Labels.md(
                                text: '1234567890',
                                textColor: context.resources.color.colorDark,
                              ),
                              const SizedBox(height: 10),
                              Divider(
                                color: context.resources.color.colorLightGray,
                                thickness: 1,
                              ),
                              const SizedBox(height: 10),
                              Labels.sm(
                                text: 'Phone',
                                textColor:
                                    context.resources.color.colorLightGray,
                              ),
                              const SizedBox(height: 10),
                              Labels.md(
                                text: '+02323323232',
                                textColor: context.resources.color.colorDark,
                              ),
                              const SizedBox(height: 10),
                              Divider(
                                color: context.resources.color.colorLightGray,
                                thickness: 1,
                              ),
                              const SizedBox(height: 10),
                              Labels.sm(
                                text: 'Email',
                                textColor:
                                    context.resources.color.colorLightGray,
                              ),
                              const SizedBox(height: 10),
                              Labels.md(
                                text: user.email,
                                textColor: context.resources.color.colorDark,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Buttons(
                              onTap: () {
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .logOut();
                                Navigator.pushNamed(context, '/');
                              },
                              text: "LOGOUT",
                              color: context.resources.color.colorAccent,
                              textColor: context.resources.color.textSecondary,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
