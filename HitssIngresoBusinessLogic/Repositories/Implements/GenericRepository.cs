using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Threading.Tasks;
using HitssIngresoBusinessLogic.Data;

namespace HitssIngresoBusinessLogic.Repositories.Implements
{
    public class GenericRepository<TEntity> : IGenericRepository<TEntity> where TEntity : class
    {
        private readonly IngresoHitssContext ingresoHitssContext;

        public GenericRepository(IngresoHitssContext ingresoHitssContext)
        {
            this.ingresoHitssContext = ingresoHitssContext;
        }

        public async Task Delete(int id)
        {
            var entity = await GetById(id);

            if (entity == null)
                throw new Exception("The entity is null");

            ingresoHitssContext.Set<TEntity>().Remove(entity);
            await ingresoHitssContext.SaveChangesAsync();
        }

        public async Task<IEnumerable<TEntity>> GetAll()
        {
            return await ingresoHitssContext.Set<TEntity>().ToListAsync();
        }

        public async Task<TEntity> GetById(int id)
        {
            return await ingresoHitssContext.Set<TEntity>().FindAsync(id);
        }

        public async Task<TEntity> Insert(TEntity entity)
        {
            ingresoHitssContext.Set<TEntity>().Add(entity);
            await ingresoHitssContext.SaveChangesAsync();
            return entity;
        }

        public async Task<TEntity> Update(TEntity entity)
        {
            //ingresoHitssContext.Entry(entity).State = EntityState.Modified;
            ingresoHitssContext.Set<TEntity>().AddOrUpdate(entity);
            await ingresoHitssContext.SaveChangesAsync();
            return entity;
        }
    }
}