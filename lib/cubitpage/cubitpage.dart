import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CUBIT/population_cubit.dart';

class Cubitpage extends StatelessWidget {
  const Cubitpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocProvider(
        create: (context) => PopulationCubit(),
        child: BlocBuilder<PopulationCubit, PopulationState>(
          builder: (context, state) {
            final unit = context.read<PopulationCubit>();
            return Column(
              children: [
                 state is Populationloading
                ? const Center(child: CircularProgressIndicator(),)
                :   state is Populationloaded ?
                Expanded(
                  child: ListView.builder(
                    itemCount: state.data.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${state.data.data[index].nation}"),
                        subtitle: Text("${state.data.data[index].population}"),
                        leading: CircleAvatar(
                          backgroundColor: Colors.purpleAccent,

                          child: Text(state.data.data[index].year),
                        ),
                      );
                  
                    },
                  
                  
                  ),
                )
                : state is Populationerror ?Center(child: Text("dadafsafs"),):SizedBox(),


              ],

            );
          },
        ),
      ),
    );
  }
}
