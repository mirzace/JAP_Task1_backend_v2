using ScreenplayApp.Core.Exceptions;
using ScreenplayApp.Core.Models;
using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Models.Responses;
using ScreenplayApp.Core.Repositories;
using ScreenplayApp.Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Infrastructure.Services
{
    public class ScreenplayService : IScreenplayService
    {
        private readonly IScreenplayRepository _screenplayRepository;
        public ScreenplayService(IScreenplayRepository screenplayRepository)
        {
            _screenplayRepository = screenplayRepository;
        }

        public async Task<PagedList<ScreenplayResponse>> GetScreenplaysAsync(ScreenplaysGetRequest request)
        {
            var screenplays = await _screenplayRepository.GetScreenplaysAsync(request);
            if (screenplays.Items.Count() == 0) throw new NotFoundException("Not found");

            return screenplays;
        }

        public async Task<ScreenplayResponse> GetScreenplayAsync(int id)
        {
            var screenplay = await _screenplayRepository.GetScreenplayAsync(id);
            if (screenplay is null) throw new NotFoundException("Screenplay with that id is not found");

            return screenplay;
        }
    }
}
