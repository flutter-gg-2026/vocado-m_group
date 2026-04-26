import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/features/team/presentation/cubit/team_cubit.dart';
import 'package:vocado/features/team/presentation/cubit/team_state.dart';
import 'package:vocado/features/team/presentation/widgets/team_widget.dart';

class TeamFeatureScreen extends StatelessWidget {
  const TeamFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TeamCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Team Feature Screen')),
      body: BlocListener<TeamCubit, TeamState>(
        listener: (context, state) {
          context.hideLoading();
          if (state is MemberSuccessState) {
            context.showBottomSheet(
              widget: state.members.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.members.length,
                      itemBuilder: (context, index) {
                        final members = state.members[index];
                        return ListTile(
                          onTap: () async {
                            cubit.addMember(
                              id: members.id ?? "",
                              name: members.name ?? "",
                              role: members.role ?? "",
                            );
                            context.pop();
                          },
                          title: Text(members.name ?? ""),
                          subtitle: Text(members.role ?? ""),
                        );
                      },
                    )
                  : Text("No Member"),
            );
          }

          if (state is AddMemberSuccessState) {
            cubit.getTeamMethod();
          }
          if (state is TeamErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: BlocBuilder<TeamCubit, TeamState>(
          buildWhen: (previous, current) {
            if (current is MemberSuccessState ||
                current is AddMemberSuccessState ||
                current is LoadingSuccessState) {
              return false;
            }

            return true;
          },
          builder: (context, state) {
            if (state is TeamSuccessState) {
              return Column(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                spacing: 10,
                children: [
                  SizedBox(
                    height: 25.sh,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.team[0].teamMembers.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return TeamWidget(
                            memberName: state.team[0].teamleadName,
                            teamName: state.team[0].name,
                            role: "Team Leader",
                          );
                        }
                        final member = state.team[0].teamMembers[index - 1];
                        return TeamWidget(
                          memberName: member.name,
                          teamName: state.team[0].name,
                          role: member.role,
                        );
                      },
                      separatorBuilder: (context, index) => Gap(16),
                    ),
                  ),
                  FilledButton(
                    onPressed: () async {
                      context.showLoading();
                      cubit.getAllMember();
                    },
                    child: Text("add a Member"),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
