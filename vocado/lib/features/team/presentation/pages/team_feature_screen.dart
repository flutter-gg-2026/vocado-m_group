import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/features/team/presentation/cubit/team_cubit.dart';
import 'package:vocado/features/team/presentation/cubit/team_state.dart';

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
                spacing: 10,
                children: [
                  SizedBox(
                    height: 20.sh,
                    child: ListView(
                      scrollDirection: .horizontal,
                      children: [
                        Container(
                          width: 40.sw,
                          height: 20.sh,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: .circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: .center,
                            mainAxisAlignment: .center,
                            children: [
                              Text(state.team[0].teamleadName),
                              Text(state.team[0].name),
                              Text("Team Leader"),
                            ],
                          ),
                        ),

                        ...state.team[0].teamMembers
                            .map(
                              (member) => Container(
                                width: 40.sw,
                                height: 20.sh,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: .circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: .center,
                                  mainAxisAlignment: .center,
                                  children: [
                                    Text(member.name),
                                    Text(state.team[0].name),
                                    Text(member.role),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ],
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
            return Text("Loading");
          },
        ),
      ),
    );
  }
}
