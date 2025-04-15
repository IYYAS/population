import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../MODEL/MODEL.dart';

part 'population_state.dart';

class PopulationCubit extends Cubit<PopulationState> {
  PopulationCubit() : super(PopulationInitial()){
    population();
  }

population() async{
    emit(Populationloading());

  final url = "https://datausa.io/api/data?drilldowns=Nation&measures=Population#";
  final response = await http.get(Uri.parse(url));
   if(response.statusCode == 200){
      final data = welcomeFromJson(response.body);
      emit(Populationloaded(data: data));
   }else{
     emit(Populationerror(error: "errror"));

   }
}
}
