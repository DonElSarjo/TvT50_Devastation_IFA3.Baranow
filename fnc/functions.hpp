class rip_devastation {

	tag = "RIP";

	class global {

		file = "fnc\global";

        class ServerLog {};
        class ChangeSideProtection {};
        class CityCapturedClient {};
        class EndMission {};
        class EjectFromVehicle {};
        class DeployMHQ {};
        class UnDeployMHQ {};
        class PunishTeamKiller {};
        class AntiAT {};
        class AddEHIncomingMissile {};
        class RecivedPointNotif {};
	};
    class client {

        file = "fnc\client";

		//class initViewDistanceControl {postInit = 1;};
		//class initVolumeControl {postInit = 1;};
		class newTargetClient {};
		class ppEffect {};
        class MarkersPlayer {};
        class MarkersVehicles {};
        class PlayerTags {};
        class Player3DTags {};
        class VehicleCrew {};
        class ScoreDisplay {};
        class PlayerActions {};
        class PilotCheck {};
        class CheckKey {};
        class DisableTI {};
        class AddPlayerActions {};
        class SaveGear {};
        class RespawnEH {};
        class 3DPersonDisable {};
        class RespawnButtonDelay {};
        class ClearBase {};
        class ChangeEquipment {};
        class AddLiftAction {};
        class AddDropAction {};
        class AddServiceAction {};
        class AddTeleportAction {};
        class UpdateTeleportMap {};
        class AddDeployMHQAction {};
        class AddRepairAction {};
        class AddLockUnlockAction {};
    };
    class server {

        file = "fnc\server";

		class newTargetServer {};
		class FastTime {};
		class Bonus {};
		class DynamicWeather {};
		class Mapper {};
		class CreateBonusVehicle {};
        class RespawnVehicleLoop {};
        class RespawnVehicle {};
        class DesertedVehicle {};
        class DetachVehicle {};
        class RemoveVehicle {};
        class MPKilledEH {};
        class GetRandomPos {};
        class ChangeAIEquipment {};
        class CreateInfGroup {};
        class CreateLightArmorGroup {};
        class CreateHardArmorGroup {};
        class CreateMines {};
        class CreateStatic {};
        class ArtyShoot {};
        class CreateArty {};
        class ClearLastTarget {};
        class RadiotowerDown {};
        class CreateCity {};
        class PlayersNearBy {};
        class CreateArmorReinforcement {};
        class CreateInfReinforcement {};
        class CheckAIDestroyed {};
        class CheckRadiotowerDown {};
        class RandomTime {};
        class CheckFlagCaptured {};
        class CityCapturedTimer {};
        class CityCaptured {};
    };
};
