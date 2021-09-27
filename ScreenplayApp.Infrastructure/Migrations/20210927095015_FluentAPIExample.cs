using Microsoft.EntityFrameworkCore.Migrations;

namespace ScreenplayApp.Infrastructure.Migrations
{
    public partial class FluentAPIExample : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BookingId1",
                table: "Tickets",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ScreenplayId1",
                table: "Tickets",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ScreenplayId2",
                table: "Tickets",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_BookingId1",
                table: "Tickets",
                column: "BookingId1");

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_ScreenplayId1",
                table: "Tickets",
                column: "ScreenplayId1");

            migrationBuilder.AddForeignKey(
                name: "FK_Tickets_Bookings_BookingId1",
                table: "Tickets",
                column: "BookingId1",
                principalTable: "Bookings",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Tickets_Screenplays_ScreenplayId1",
                table: "Tickets",
                column: "ScreenplayId1",
                principalTable: "Screenplays",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tickets_Bookings_BookingId1",
                table: "Tickets");

            migrationBuilder.DropForeignKey(
                name: "FK_Tickets_Screenplays_ScreenplayId1",
                table: "Tickets");

            migrationBuilder.DropIndex(
                name: "IX_Tickets_BookingId1",
                table: "Tickets");

            migrationBuilder.DropIndex(
                name: "IX_Tickets_ScreenplayId1",
                table: "Tickets");

            migrationBuilder.DropColumn(
                name: "BookingId1",
                table: "Tickets");

            migrationBuilder.DropColumn(
                name: "ScreenplayId1",
                table: "Tickets");

            migrationBuilder.DropColumn(
                name: "ScreenplayId2",
                table: "Tickets");
        }
    }
}
